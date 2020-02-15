
def imdb2Peli (ximdb)
  k = Pelicula.new
  
  if not(ximdb.es_serie)
	k.titulo = ximdb.title2[0]
	k.titulo_original = ximdb.title2[1]
	k.anio = ximdb.anio[0]
	k.imdb_code = ximdb.title2[2]
	ximdb.writer.each  do |cada|
		k.writers.new({:nombre => cada})
	end
	elcast = ximdb.cast
  else
	k.titulo = ximdb.title_serie[0]
	k.titulo_original = ximdb.title_serie[1]
	k.anio = ximdb.anio_serie[0]
	k.imdb_code = ximdb.title_serie[2]
	ximdb.creator.each  do |cada|
		k.writers.new({:nombre => cada})
	end
	elcast = ximdb.cast_serie
  end
  
#  k.titulo = ximdb.title[0]
#  k.titulo_original = ximdb.title[2]
#  k.anio = ximdb.title[1]
#  k.imdb_code = ximdb.title[3]
  k.formato = 'N/A'
  k.media = 'N/A'
  k.comment = ''
  k.fecha = Time.now 

  ximdb.director.each  do |cada|
    k.directors.new({:nombre => cada})
  end
            
#  ximdb.writer.each  do |cada|
#    k.writers.new({:nombre => cada})
#  end

  ximdb.genre.each  do |cada|
    k.generos.new({:nombre => cada})
  end

  ximdb.country.each  do |cada|
    k.nacions.new({:nombre => cada})
  end

  ximdb.language.each  do |cada|
    k.idiomas.new({:nombre => cada})
  end

  ximdb.sound.each  do |cada|
    k.sonidos.new({:nombre => cada})
  end

  ximdb.color.each  do |cada|
    k.colors.new({:nombre => cada})
  end

  n = 1
  elcast.each  do |cada|
    k.elencos.new ({:nombre => cada[0],
                    :personaje => ((cada[1] == "" || cada[1].nil?)  ? " " : cada[1]),
                    :orden => n})
    n = n + 1
  end

  ximg = "./public/posters/" + k.imdb_code + ".jpg"
  if ximdb.poster.count == 0
    FileUtils.copy_file( "./public/images/noposter.jpg",ximg)
  else
    File.open(ximg, 'wb') do |fo|
      fo.write open(ximdb.poster[0]).read
    end
  end
  k

end

def peliDummy
  k = Pelicula.new
  k.titulo = ""
  k.titulo_original = ""
  k.anio = ""
  k.imdb_code = ""
  k.formato = "N/A"
  k.media = 'N/A'
  k.comment = ''
  k.fecha = Time.now 
  k
end

def post2Peli(m)
  if m == "ALTA"
	k = Pelicula.new
  else
	k = Pelicula.busca_por_id(session[:pelicula_id].to_i)
  end
  k.titulo = params[:Xtitulo]
  k.titulo_original = params[:Xoriginal]
  k.anio = params[:Xanio]
  k.imdb_code = params[:Ximdb]
  k.formato = params[:Xformato]
  k.media = params[:Xmedia]
  k.comment = params[:Xobserv]
  k.fecha = Time.now 

  if m == "MODIFICA"
	k.directors.destroy_all
	k.writers.destroy_all
	k.generos.destroy_all
	k.nacions.destroy_all
	k.idiomas.destroy_all
	k.sonidos.destroy_all
	k.colors.destroy_all
  end	
	
  separa(params[:Xdirector]).each  do |cada|
    k.directors.new({:nombre => cada})
  end

  separa(params[:Xwriter]).each  do |cada|
    k.writers.new({:nombre => cada})
  end

  separa(params[:Xgenero]).each  do |cada|
    k.generos.new({:nombre => cada})
  end

  separa(params[:Xnacion]).each  do |cada|
    k.nacions.new({:nombre => cada})
  end

  separa(params[:Xidioma]).each  do |cada|
    k.idiomas.new({:nombre => cada})
  end

  separa(params[:Xsonido]).each  do |cada|
    k.sonidos.new({:nombre => cada})
  end
  
  separa(params[:Xcolor]).each  do |cada|
    k.colors.new({:nombre => cada})
  end

  if m == "ALTA"
	  n = 1
	  separa2(params[:Xelenco]).each  do |cada|
		k.elencos.new({:nombre => cada[0],
					   :personaje => ((cada[1] == "" || cada[1].nil?)  ? " " : cada[1]),
					   :orden => n})
		n = n + 1
	  end
  end
  k

end