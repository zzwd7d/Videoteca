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
    id = Pelicula.select("id").where("imdb_code = ?",a_code).first
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

  def self.busca_por_id_json(a_id)
    peli = Pelicula.includes(:colors,:directors,:elencos,:generos,:idiomas,:nacions,:sonidos,:writers).find(a_id)
    res = JSON.parse(peli.to_json)
	res["color"] = JSON.parse(peli.colors.to_json)
	res["director"] = JSON.parse(peli.directors.to_json)
	res["elenco"] = JSON.parse(peli.elencos.to_json)
	res["genero"] = JSON.parse(peli.generos.to_json)
	res["idioma"] = JSON.parse(peli.idiomas.to_json)
	res["nacion"] = JSON.parse(peli.nacions.to_json)
	res["sonido"] = JSON.parse(peli.sonidos.to_json)
	res["writer"] = JSON.parse(peli.writers.to_json)
	res["poster"] = "/posters/" + res["imdb_code"] + ".jpg" 
	res
  end



	def self.graba_pelicula(m)
	  if m["id"] == 0
		  k = Pelicula.new
	  else
		  k = Pelicula.busca_por_id(m["id"])
	  end
	  k.titulo = m["titulo"]
	  k.titulo_original = m["titulo_original"]
	  k.anio = m["anio"]
	  if m["imdb_code"] == 'qq'
		nuevo_qq  = self.next_qq()
		k.imdb_code = nuevo_qq
		FileUtils.copy_file( "./public/auxiliar/noposter.jpg","./public/auxiliar/" + nuevo_qq + ".jpg")
		m["poster"] = "/auxiliar/" + nuevo_qq + ".jpg"
	  else
		k.imdb_code = m["imdb_code"]
	  end
	  k.formato = m["formato"]
	  k.media = m["media"]
	  k.comment = m["comment"]
	  k.fecha = Time.now 

	  if m["id"] > 0
		k.directors.destroy_all
		k.writers.destroy_all
		k.generos.destroy_all
		k.nacions.destroy_all
		k.idiomas.destroy_all
		k.sonidos.destroy_all
		k.colors.destroy_all
		k.elencos.destroy_all
	  else
		FileUtils.mv("./public" + m["poster"], "./public/posters")
	  end	
		
	  m["director"].each  do |cada|
		k.directors.new({:nombre => cada["nombre"]})
	  end

	  m["writer"].each  do |cada|
		k.writers.new({:nombre => cada["nombre"]})
	  end

	  m["genero"].each  do |cada|
		k.generos.new({:nombre => cada["nombre"]})
	  end

	  m["nacion"].each  do |cada|
		k.nacions.new({:nombre => cada["nombre"]})
	  end

	  m["idioma"].each  do |cada|
		k.idiomas.new({:nombre => cada["nombre"]})
	  end

	  m["sonido"].each  do |cada|
		k.sonidos.new({:nombre => cada["nombre"]})
	  end
	  
	  m["color"].each  do |cada|
		k.colors.new({:nombre => cada["nombre"]})
	  end
	  
	  n = 1
	  m["elenco"].each do |cada|
		  k.elencos.new({:nombre => cada["nombre"],
			  		     :personaje => cada["personaje"],
					     :orden => n})
		  n = n + 1
	  end

	  k.save

	  m["id"] = k.id

	  m

	end

	def self.pelicula_vacia()
	  m = Hash.new
 
	  m["id"] = 0
	  m["titulo"] = ''
	  m["titulo_original"] = ''
	  m["anio"] = ''
	  m["imdb_code"] = 'qq'
	  m["formato"] = ''
	  m["media"] = ''
	  m["comment"] = ''
	  m["poster"] = "/auxiliar/noposter.jpg"
	  		
	  m["director"] = []

	  m["writer"] = []

	  m["genero"] = []

	  m["nacion"] = []

	  m["idioma"] = []

	  m["sonido"] = []
	  
	  m["color"] = []
	  
	  m["elenco"] = []
	  
	  m

	end
	
	def self.next_qq()
		max = Pelicula.select("imdb_code").where("imdb_code like 'qq%'").order(imdb_code: :desc).first
		if max.imdb_code.nil?
			n = 1
		else 
			n = max.imdb_code[2..-1].to_i + 1
		end
		"qq" + n.to_s.rjust(7,'0')
	end


end