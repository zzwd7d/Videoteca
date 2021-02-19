require "sinatra"
require 'sinatra/activerecord'
require "./constantes"
require "./IMDB3"
require "open-uri"
require "will_paginate"
require "will_paginate/active_record"
require 'openssl'
require 'yaml'
require 'json'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

enable :sessions, :logging

@config = YAML.load_file("config.yml")

set :ambiente, @config['servicio']['ambiente']
set :port, @config['servicio']['port']

set :pelisXdirec, @config["params"]["pelisXdirec"]
set :pelisXactor, @config["params"]["pelisXactor"]

set :dbadapter, @config["base"]["adapter"]
set :dbhost, @config["base"]["host"]
set :dbport, @config["base"]["port"]
set :dbusername, @config["base"]["username"]
set :dbpassword, @config["base"]["password"]
set :dbase, @config["base"]["dbname"]

set :origen, @config["publicar"]["origen"]
set :destino, @config["publicar"]["destino"]

p "ARRANCA #{@config['servicio']['ambiente']} - Modo #{Sinatra::Application.environment}"

configure do
  Version = Sinatra::VERSION
end

require './models/pelicula'
require './models/director'
require './models/elenco'
require './models/genero'
require './models/color'
require './models/idioma'
require './models/nacion'
require './models/sonido'
require './models/writer'

ActiveRecord::Base.establish_connection(
  :adapter  => settings.dbadapter,
  :host     => settings.dbhost, 
  :port     => settings.dbport,
  :username => settings.dbusername,
  :password => settings.dbpassword,
  :database => settings.dbase
)

get '/' do
  erb :vid01
end

post '/dimensiones' do
	session[:iwidth] = params[:iwidth].to_i
	session[:iheight] = params[:iheight].to_i
	
	xheader = 80 + 25  

	session[:xcols] =  8 
	session[:xfils] = 2 
	
	session[:xwidth] = (session[:iwidth] * 0.9).to_i / session[:xcols]
	session[:xheight] = (session[:xwidth] * 1.56).to_i
	
	session[:pelxpag] = session[:xcols] * session[:xfils]
	
	session[:nro_page] =  params[:page]
	session[:nro_page] = "1"  if session[:nro_page].nil?

	session[:fdirector] = nil
	session[:felenco] = nil
	session[:fgenero] = nil
	session[:fdecada] = '0000~9999'

	session[:nro_page] =  "1" 
	armaListado()
end

post '/Listados' do
	session[:nro_page] =  if session[:nro_page].nil? then "1" else params[:param1] end
	armaListado();
end
	
def armaListado 
	@Directores = Director.resumen_combo(settings.pelisXdirec)
	@Elencos = Elenco.resumen_combo(settings.pelisXactor)
	@Generos = Genero.resumen_combo

	director = if session[:fdirector] == 'all' then nil else session[:fdirector] end
	elenco =  if session[:felenco] == 'all' then nil else elenco = session[:felenco] end
	genero =  if session[:fgenero] == 'all' then nil else genero = session[:fgenero] end
	fechas = session[:fdecada].split('~')

	@Lista = Pelicula.por_director(director).por_elenco(elenco).por_genero(genero)
				   .por_decada(fechas[0],fechas[1])
				   .paginate(:page => session[:nro_page],:per_page => session[:pelxpag])

	erb :vid02
end

post '/consulta' do
	arma_consulta(params["param0"],-1)
end
    
def arma_consulta(el_id, vuelta)
	session[:pelicula_id] = el_id

	peli = Pelicula.busca_por_id_json(el_id)

	erb :vid04 , locals: {film: peli.to_json, formas: FORMATOS, medios: MEDIAS, lavuelta: vuelta}
end

post '/alta' do
	erb :vid03
end

post '/busca' do
    session[:fdirector] = params[:Xdirectores]
    session[:felenco] = params[:Xelencos]
    session[:fgenero] = params[:Xgeneros]
    session[:fdecada] = params[:Xdecadas]

	session[:nro_page] =  nil 
    armaListado()
end

post '/generaBusquedaName'  do
	session[:KeyName] = params[:KeyName]
	if session[:KeyName] == ""
		movies_list = []
	else
		imdbx = IMDB2.new('list',session[:KeyName])
		movies_list = imdbx.movies
	end
	movies_list.to_json
end

post '/generaBusquedaCode'  do
	session[:imdbCode] = params[:imdbCode]
	if session[:imdbCode] == ""
		movies_list = []
	else
		imdbx = IMDB2.new('movie',session[:imdbCode])
		movies_list = []
		una_movie = []
		movie = JSON.parse(imdbx.json_movie())
		una_movie << movie["spanish title"]+' ('+movie["year"]+')'
		una_movie << movie["imdbcode"]
		movies_list << una_movie
	end
	movies_list.to_json
end


post '/muestraPeli' do
	if not params[:param0].nil?
		existe = Pelicula.por_imdb_code(params[:param0])
		if existe.nil?
			imdbx = IMDB2.new('movie',params[:param0])
			peli = imdbx.json_movie()  
			erb :vid04, locals: {film: peli.to_json, formas: FORMATOS, medios: MEDIAS, lavuelta: -1}
		else
			arma_consulta(existe.id,-1)
		end 
	else
		redirect '/alta',307
	end
end

post '/grabaPeli' do
	peli = JSON.parse(params[:param0]);
	peli = Pelicula.graba_pelicula(peli)
	arma_consulta(peli["id"].to_i, -2)
end

post '/borraPeli' do
	Pelicula.where(id: params[:param0]).destroy_all
	armaListado()
end

post '/publicaPelicula' do
	filenames = Dir.glob(settings.origen+'/'+params[:id]+'*')	
	dir_nom =  filenames[0].split('/')[-1]	
	FileUtils.cp_r settings.origen+"/"+dir_nom, settings.destino
	'Ok'
end

def get2post(ht)
	@doc = Nokogiri::HTML(ht)
    @doc.xpath('//a').each  do |node|
		xnew = '#" title="Page ?" onclick="Redireccion(?);return false;"'
		xref = node['href'] + '"'
		xpage=xref[xref.index('=')+1..-1][0..-2]
		xnew = xnew.gsub('?',xpage)
		ht = ht.gsub(xref,xnew)
    end
	ht	
end

def tdcolor( n )
  salida = case n.divmod(5)[1]
                when 0 then "color1"
                when 1 then "color2"
                when 2 then "color3"
                when 3 then "color4"
                when 4 then "color5"
           end
  salida
end
