require "sinatra"
require 'sinatra/activerecord'
require "./constantes"
require "./IMDB3"
require "./varios"
require "open-uri"
require "will_paginate"
require "will_paginate/active_record"
require 'openssl'
require 'yaml'

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

p "ARRANCA #{@config['servicio']['ambiente']}"

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

require "./transf_peli"

ActiveRecord::Base.establish_connection(
  :adapter  => settings.dbadapter,
  :host     => settings.dbhost, 
  :port     => settings.dbport,
  :username => settings.dbusername,
  :password => settings.dbpassword,
  :database => settings.dbase
)

get '/' do
  redirect "/home"
end

get '/home' do
  session[:nro_page] =  params[:page]
  session[:nro_page] = "1" if session[:nro_page].nil?

  session[:fdirector] = nil
  session[:felenco] = nil
  session[:fgenero] = nil
  session[:fdecada] = '0000~9999'
  session[:fcomment] = nil
  @Lista=nil

  redirect "/armaListado?page="+ session[:nro_page]
end

get '/armaListado' do
  session[:nro_page] =  if session[:nro_page].nil? then "1" else params[:page] end

  @Directores = Director.resumen_combo(settings.pelisXdirec)
  @Elencos = Elenco.resumen_combo(settings.pelisXactor)
  @Generos = Genero.resumen_combo

  director = if session[:fdirector] == 'all' then nil else session[:fdirector] end
  elenco =  if session[:felenco] == 'all' then nil else elenco = session[:felenco] end
  genero =  if session[:fgenero] == 'all' then nil else genero = session[:fgenero] end
  fechas = session[:fdecada].split('~')

  @Lista = Pelicula.por_director(director).por_elenco(elenco).por_genero(genero)
                   .por_decada(fechas[0],fechas[1]).con_comentarios(session[:fcomment])
                   .paginate(:page => session[:nro_page],:per_page => PELXPAG)

  erb :ListadoPeli
end

get '/consulta/:ref' do
  arma_consulta(params[:ref])
end
  
def arma_consulta(el_id)
  @Id = el_id
  @Modo = "CONSULTA"
  @movies_list = []
  @error_msg = ""
  @peli = Pelicula.busca_por_id(@Id)
  erb :AltaPEli
end

post '/alta' do
  if params[:botonera] == "Buscar"
    session[:fdirector] = params[:Xdirectores]
    session[:felenco] = params[:Xelencos]
    session[:fgenero] = params[:Xgeneros]
    session[:fdecada] = params[:Xdecadas]
    session[:fcomment] = params[:Xcomments]
    @Lista=nil
    redirect "/armaListado?page=1"
  end
  @Modo = "ALTA"
  @movies_list = []
  @peli = peliDummy
  @Key = ""
  @error_msg = ""
  erb :AltaPEli
end

post '/muestraLista'  do
  @Modo = "ALTA"
  @Key = params[:KeyName]
  session[:KeyName] = @Key
  if @Key == ""
    @movies_list = []
  else
    imdbx = IMDB2.new('list',@Key)
    @movies_list = imdbx.movies
  end
  @error_msg = ""
  @peli = peliDummy
  erb :AltaPEli
end

post '/muestraPeli' do
  @Modo = "ALTA"
  @movie_code = params[:MovieCode]
  session[:movie_code] = @movie_code
  if @movie_code != ""
    existe = Pelicula.por_imdb_code(@movie_code)
	if existe.nil?
		imdbx = IMDB2.new('movie',@movie_code)
		@peli = imdb2Peli(imdbx)
	else
		arma_consulta(existe.id)
	end 
  end
  @Key = session[:KeyName]
  @movies_list = separa2(params[:Xmovies])
  @error_msg = ""
  erb :AltaPEli
end

post '/guardarPeli' do
  @Modo = "ALTA"
  if params[:botonera] == "Volver"
    redirect "/armaListado?page="+ session[:nro_page]
  end
  @error_msg = ""
  @peli = post2Peli
  if es_completa
    begin
      @peli.save
    rescue => e
      @error_msg = e.message
    end
  end
  @Key = session[:KeyName]
  @movies_list = separa2(params[:Xmovies2])
  @movie_code = session[:movie_code]
  erb :AltaPEli
end

