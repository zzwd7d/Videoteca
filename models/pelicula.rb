class Pelicula < ActiveRecord::Base
  has_many :generos, :dependent => :delete_all
  has_many :idiomas, :dependent => :delete_all
  has_many :colors, :dependent => :delete_all
  has_many :nacions, :dependent => :delete_all
  has_many :directors, :dependent => :delete_all
  has_many :writers, :dependent => :delete_all
  has_many :elencos, :dependent => :delete_all
  has_many :sonidos, :dependent => :delete_all

  def self.por_director(a_nombre)
    if a_nombre.nil?
      Pelicula.all.order(:titulo)
    else
      Pelicula.joins(:directors).where(:directors => {:nombre => a_nombre}).all.order(:titulo)
    end
  end

  def self.por_elenco(a_nombre)
    if a_nombre.nil?
      Pelicula.all.order(:titulo)
    else
      Pelicula.joins(:elencos).where(:elencos => {:nombre => a_nombre}).all.order(:titulo)
    end
  end

  def self.por_imdb_code(a_code)
    id = Pelicula.where("imdb_code = ?",a_code).first
  end

  def self.por_genero(a_genero)
    if a_genero.nil?
      Pelicula.all.order(:titulo)
    else
      Pelicula.joins(:generos).where(:generos => {:nombre => a_genero}).all.order(:titulo)
    end
  end

  def self.por_decada(a_desde,a_hasta)
     Pelicula.where("anio >= ? and anio <= ?",a_desde,a_hasta).all.order(:titulo)
  end

  def self.con_comentarios(a_comments)
    if a_comments.nil?
      Pelicula.all.order(:titulo)
    else
      Pelicula.where("comment <> ?","").all.order(:titulo)
#      all(:comment.not => "", :order => [:titulo])
    end
  end

  def self.busca_por_id(a_id)
    Pelicula.includes(:colors,:directors,:elencos,:generos,:idiomas,:nacions,:sonidos,:writers).find(a_id)
  end

end