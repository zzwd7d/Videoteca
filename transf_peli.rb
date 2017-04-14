
def imdb2Peli (ximdb)
  k = Pelicula.new
  k.attributes =  { :titulo => ximdb.title[0],
                    :tituloOriginal => ximdb.title[2],
                    :anio => ximdb.title[1],
                    :imdbCode => ximdb.title[3],
                    :formato => 'N/A',
                    :media => 'N/A',
                    :comment => '',
                    :fecha => Time.now }

  ximdb.director.each  do |cada|
    k.directors.first_or_new({:nombre => cada})
  end

  ximdb.writer.each  do |cada|
    k.writers.first_or_new({:nombre => cada})
  end

  ximdb.genre.each  do |cada|
    k.generos.first_or_new({:nombre => cada})
  end

  ximdb.country.each  do |cada|
    k.nacions.first_or_new({:nombre => cada})
  end

  ximdb.language.each  do |cada|
    k.idiomas.first_or_new({:nombre => cada})
  end

  ximdb.sound.each  do |cada|
    k.sonidos.first_or_new({:nombre => cada})
  end

  ximdb.color.each  do |cada|
    k.colors.first_or_new({:nombre => cada})
  end

  n = 1
  ximdb.cast.each  do |cada|
    k.elencos.new ({:nombre => cada[0],
                    :personaje => ((cada[1] == "" || cada[1].nil?)  ? " " : cada[1]),
                    :orden => n})
    n = n + 1
  end

  ximg = "./public/posters/" + ximdb.title[3] + ".jpg"
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
  k.attributes =  { :titulo => "",
                    :tituloOriginal => "",
                    :anio => "",
                    :imdbCode => "",
                    :formato => "N/A",
                    :media => 'N/A',
                    :comment => '',
                    :fecha => Time.now }
  k
end

def post2Peli
  k = Pelicula.new
  k.attributes =  { :titulo => params[:Xtitulo],
                    :tituloOriginal => params[:Xoriginal],
                    :anio => params[:Xanio],
                    :imdbCode => params[:Ximdb],
                    :formato => params[:Xformato],
                    :media => params[:Xmedia],
                    :comment => params[:Xobserv],
                    :fecha => Time.now }

  separa(params[:Xdirector]).each  do |cada|
    k.directors.first_or_new({:nombre => cada})
  end

  separa(params[:Xwriter]).each  do |cada|
    k.writers.first_or_new({:nombre => cada})
  end

  separa(params[:Xgenero]).each  do |cada|
    k.generos.first_or_new({:nombre => cada})
  end

  separa(params[:Xnacion]).each  do |cada|
    k.nacions.first_or_new({:nombre => cada})
  end

  separa(params[:Xidioma]).each  do |cada|
    k.idiomas.first_or_new({:nombre => cada})
  end

  separa(params[:Xsonido]).each  do |cada|
    k.sonidos.first_or_new({:nombre => cada})
  end

  separa(params[:Xcolor]).each  do |cada|
    k.colors.first_or_new({:nombre => cada})
  end

  n = 1
  separa2(params[:Xelenco]).each  do |cada|
    k.elencos.new({:nombre => cada[0],
                   :personaje => ((cada[1] == "" || cada[1].nil?)  ? " " : cada[1]),
                   :orden => n})
    n = n + 1
  end

  k

end