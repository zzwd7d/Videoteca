#=> #<Encoding:UTF-8>
class IMDB2
	# To change this template use File | Settings | File Templates.
	
	require 'open-uri'
	require 'nokogiri'
	
	require 'uri'
	require 'net/http'
	require 'openssl'
	require 'json'
	
	def busca_data (api_name, tt) 
		url = URI("https://imdb8.p.rapidapi.com/title/"+api_name+"?tconst="+tt)

		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(url)
		request["x-rapidapi-key"] = @apiKey    #'28931b19cbmshe112f0c06240729p159347jsn6137189f0601'
		request["x-rapidapi-host"] = 'imdb8.p.rapidapi.com'

		response = http.request(request)

		puts "API Info => Restan: #{response.to_hash["x-ratelimit-requests-remaining"][0]} - tiempo reset: #{response.to_hash["x-ratelimit-requests-reset"][0]}"

		JSON.parse(response.read_body)
	end

	def initialize (tipo, dato, clave)
		@code = dato.strip.gsub(/ /,'+')
		@apiKey = clave
		if tipo == 'list'
			url = "https://www.imdb.com/find?q=" + @code + "&s=tt"
			(1..5).each do |n|
				begin
					userAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17"
					f = open(url, {ssl_verify_mode: 0}) #OpenSSL::SSL::VERIFY_NONE}) #,
					@doc = Nokogiri::HTML(f, nil, Encoding::UTF_8.to_s)
					break
				rescue => e
					puts "ERROR "+"("+n.to_s+" de 5) buscando "+url+ " -> error: "+e.message
					sleep(10)
				end
			end
		else
			@res = busca_data("get-overview-details",dato)
			@res1 = busca_data("get-versions",dato)
			@res2 = busca_data("get-full-credits",dato)
			@res3 = busca_data("get-technical",dato)
		end
	end

    def movies
		@movies =[]
		titulos =[]

		@doc.xpath('//td[@class = "result_text"]').each do |node|
			titulos << node.text.split('aka')[0].strip
		end	
		refers = []
		@doc.xpath('//td[@class = "result_text"]/a').each do |node|
			refers << node['href'].split('/')[2]
		end
		for i in 0..(titulos.count - 1)
			if not(titulos[i].include? "TV Episode") and not(titulos[i].include? "Video Game")
				aux=[]
				aux << titulos[i]
				aux << refers[i]
				@movies << aux
			end
		end
		
			
		if @movies.size == 0
			aux=[]
			aux << 'No hay títulos'
			aux << 'no-tt'
			@movies << aux
		end
		
		@movies
	end
  
	def es_serie
		es_serie = true
		
		if @res["title"]["titleType"] == 'movie'
			es_serie = false
		end 
  	
		es_serie
	end

	def title2
		title = []
 
		title_text = ""
		@res1["alternateTitles"].each do |untit|
			if untit["region"] == 'AR'
				title_text = untit["title"]
				break
			end
		end
		title << title_text
	
		title << @res1["originalTitle"]
   
		title << @code

		title
	end

	def anio
		title = []

		title << @res["title"]["year"]

		title
	end

	def director
		salida = []
		if not @res2["crew"]["director"].nil?
			@res2["crew"]["director"].each do |undir|
				salida << undir["name"]
			end
		end

		salida
	end
  
	def genre
		@res["genres"]
	end

	def writer
		salida = []
		if not @res2["crew"]["writer"].nil?
			@res2["crew"]["writer"].each do |undir|
				salida << undir["name"]
			end
		end
		salida
	end

	def creator
		salida = []
		if not @res2["crew"]["writer"].nil?
			@res2["crew"]["writer"].each do |undir|
				if undir["job"] == "created by" or undir["job"] == "creator" 
					salida << undir["name"]
				end
			end
		end
		salida
	end

	def country
		salida = []
		if not @res1["origins"].nil?
			@res1["origins"].each do |ispa|
				pais = ispa
				ISO_COUNTRIES.each do |uno|
					if uno[:"alpha-2"] == ispa then
						pais = uno[:"name"]
						break
					end
				end
				salida << pais
			end
		end
		salida
	end

	def language
		salida=[]
		if not @res1["spokenLanguages"].nil?
			@res1["spokenLanguages"].each do |lengua|
				idio = lengua
				ISO_LANGUAJES.each do |k,v|
					if k.to_s == lengua then 
						idio = v[:"name"].split(',')[0]
						break
					end
				end
				salida << idio
			end
		end
		salida
	end

	def sound
		salida = []
		if not @res3["soundMixes"].nil?
			@res3["soundMixes"].each do |undir|
				salida << undir.split('(')[0].strip
			end
		end
		salida
	end

	def color
		salida = []
		if not @res3["colorations"].nil?
			@res3["colorations"].each do |undir|
				salida << undir.split('(')[0].strip
			end
		end
		salida
	end

	def cast
		salida = []
		(0 .. 19).each do |nro|
			if not @res2["cast"][nro].nil?
				actor = @res2["cast"][nro]["name"]
				personaje = ""
				if not @res2["cast"][nro]["characters"].nil?
					@res2["cast"][nro]["characters"].each do |uno|
						personaje += " / " + uno 
					end
				else	
					personaje = " / "
				end
				salida << [actor, personaje[3 .. -1]] 
			end
		end
		salida	
	end
  
	def en_coleccion(i_code)
		r = Coleccion.where(:imdb_code => i_code)
		salida = []
		r.each do |cada|
			salida << cada.coleccion_code
		end
		salida
	end

	def poster
		salida = []
		salida << @res["title"]["image"]["url"]
		salida
	end
  
	def json_movie_test ()
		res = Hash.new
		if not(self.es_serie)
			res["spanish title"] = self.title2[0]
			res["original title"]  = self.title2[1]
			res["year"] = self.anio[0]
			res["imdbcode"] = self.title2[2]
			res["writer"] = self.writer
			res["cast"] = self.cast
		else
			res["spanish title"] = self.title_serie[0]
			res["original title"] = self.title_serie[1]
			res["year"] = self.anio_serie[0]
			res["imdbcode"] = self.title_serie[2]
			res["writer"] =  self.creator
			res["cast"] = self.cast_serie
		end
		res["director"] = self.director
		res["genre"] = self.genre
		res["country"] = self.country
		res["language"] = self.language
		res["sound"] = self.sound
		res["color"] = self.color
		res["poster"] = self.poster[0]
		res	
	end
  
	def json_movie ()
		res = Hash.new
		res["id"] = 0
		res["titulo"] = self.title2[0]
		res["titulo_original"]  = self.title2[1]
		res["anio"] = self.anio[0]
		res["imdb_code"] = self.title2[2]

		if not(self.es_serie)
			res["writer"] = peli_2_array(self.writer)
		else
			res["writer"] =  peli_2_array(self.creator)
		end

		elcast = self.cast	
		newcast = []
		elcast.each do |uno|
			newcast.push("nombre" => uno[0],"personaje" =>uno[1])	
		end
		res["elenco"] = newcast
		res["director"] = peli_2_array(self.director)
		res["genero"] = peli_2_array(self.genre)
		res["nacion"] = peli_2_array(self.country)
		res["idioma"] = peli_2_array(self.language)
		res["sonido"] = peli_2_array(self.sound)
		res["color"] = peli_2_array(self.color)

		ximg = "./public/auxiliar/" + res["imdb_code"] + ".jpg"
		url_poster = self.poster
		if url_poster.count == 0
			FileUtils.copy_file( "./public/images/noposter.jpg",ximg)
		else
			File.open(ximg, 'wb') do |fo|
				fo.write open(url_poster[0]).read
			end	
		end
		res["poster"] = "/auxiliar/" + res["imdb_code"] + ".jpg"
		res["colecciones"] = en_coleccion(res["imdb_code"])
		res["comment"] = ""
		res["formato"] = "N/A"
		res["media"] = "N/A"

		res
	end
  
	def peli_2_array (x)
		newarr = []
		x.each do |uno|
			newarr.push("nombre" =>uno)	
		end
		newarr
	end
  
	def sin_C2A0 (x)
		x.gsub(/\p{Space}/,' ') unless x.nil?
	end

	def internalSpaces(txt)
		while txt.include? "  "
			txt = txt.gsub("  "," ")
		end
		txt
	end
end


