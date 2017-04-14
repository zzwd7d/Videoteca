require "sinatra"
require "./constantes"
require "./IMDB2"
require "./varios"
require "open-uri"
require "will_paginate"
require "will_paginate/data_mapper"


enable :sessions, :logging

configure(:production){
set :port,8080
set :ambiente,"Produccion"
set :dbname,'peliculas_prod'
set :pelisXdirec, 2
set :pelisXactor, 4
p "ARRANCA PRODUCCION"
}

configure(:development){
set :port,4567
set :ambiente,"Desarrollo"
set :dbname,'peliculas_desa'
set :pelisXdirec, 2
set :pelisXactor, 2
p "ARRANCA DESARROLLO"
}

configure do
  Version = Sinatra::VERSION
end

require "./modelo"
require "./transf_peli"



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
  @Modo = "CONSULTA"
  @Id = params[:ref]
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
    imdbx = IMDB2.new('movie',@movie_code)
    @peli = imdb2Peli(imdbx)
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
