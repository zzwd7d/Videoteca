require 'data_mapper'
#require 'dm-migrations'

DataMapper.setup(:default, {
    :adapter  => 'mysql',
    :database => settings.dbname,
    :username => 'root',
    :password => 'mysql',
    :host     => 'localhost'})

class Pelicula
  include DataMapper::Resource

  property :id,             Serial                       # primary serial key
  property :titulo,         String,  :length => 100, :required => true   # Cannot be nil
  property :tituloOriginal, String,  :length => 100
  property :anio,           String,  :length => 15,  :required => true
  property :imdbCode,       String,  :length => 15
  property :formato,        String,  :length => 15
  property :media,          String,  :length => 15
  property :comment,        String,  :length => 1000
  property :fecha,          DateTime

  has n, :generos
  has n, :idiomas
  has n, :colors
  has n, :nacions
  has n, :directors
  has n, :writers
  has n, :elencos
  has n, :sonidos

  def self.por_director(a_nombre)
    if a_nombre.nil?
      all(:order => [:titulo])
    else
      all(Pelicula.directors.nombre => a_nombre, :order => [:titulo])
    end
  end

  def self.por_elenco(a_nombre)
    if a_nombre.nil?
      all(:order => [:titulo])
    else
      all(Pelicula.elencos.nombre => a_nombre, :order => [:titulo])
    end
  end

  def self.por_genero(a_genero)
    if a_genero.nil?
      all(:order => [:titulo])
    else
      all(Pelicula.generos.nombre => a_genero, :order => [:titulo])
    end
  end

  def self.por_decada(a_desde,a_hasta)
    all(:anio.gte => a_desde,:anio.lte => a_hasta, :order => [:titulo])
  end

  def self.con_comentarios(a_comments)
    if a_comments.nil?
      all(:order => [:titulo])
    else
      all(:comment.not => "", :order => [:titulo])
    end
  end

  def self.busca_por_id(a_id)
    get(a_id)
  end

end

class Genero
  include DataMapper::Resource

  property :id,             Serial
  property :nombre,         String,  :length => 30

  belongs_to :pelicula, :key => true

  def self.resumen_combo()
    Genero.aggregate(:nombre, :all.count, :order => [:nombre.asc])
  end

end

class Idioma
  include DataMapper::Resource

  property :id,             Serial
  property :nombre,         String,  :length => 30

  belongs_to :pelicula, :key => true

end

class Color
  include DataMapper::Resource

  property :id,             Serial
  property :nombre,         String,  :length => 30

  belongs_to :pelicula, :key => true

end

class Sonido
  include DataMapper::Resource

  property :id,             Serial
  property :nombre,         String,  :length => 50

  belongs_to :pelicula, :key => true

end

class Nacion
  include DataMapper::Resource

  property :id,             Serial
  property :nombre,         String,  :length => 30

  belongs_to :pelicula, :key => true

end

class Director
  include DataMapper::Resource

  property :id,             Serial
  property :nombre,         String,  :length => 50

  belongs_to :pelicula, :key => true

  def self.resumen_combo(limite)
    aux = Director.aggregate(:nombre, :all.count, :order => [:nombre.asc])
    aux.delete_if {|x| x[1] < limite}
  end
end

class Writer
  include DataMapper::Resource

  property :id,             Serial
  property :nombre,         String,  :length => 50

  belongs_to :pelicula, :key => true

end

class Elenco
  include DataMapper::Resource

  property :id,             Serial
  property :nombre,         String,  :length => 50
  property :personaje,      String,  :length => 50
  property :orden,          Integer

  belongs_to :pelicula, :key => true

  def self.resumen_combo(limite)
    aux = Elenco.aggregate(:nombre, :all.count, :order => [:nombre.asc])
    aux.delete_if {|x| x[1] < limite}
  end
end

DataMapper.finalize
#DataMapper.auto_upgrade!
#DataMapper.auto_migrate!

