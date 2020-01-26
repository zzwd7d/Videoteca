#=> #<Encoding:UTF-8>
class IMDB2
  # To change this template use File | Settings | File Templates.
  require 'open-uri'
  require 'nokogiri'

  def initialize (tipo, dato )
    #p dato
    @code = dato.strip.gsub(/ /,'+')
    if tipo == 'list'
      url = "https://www.imdb.com/find?q=" + @code + "&s=tt"
    else
      url = "https://www.imdb.com/title/" + dato
    end
    (1..5).each do |n|
      begin
        f = open(url,{ssl_verify_mode: 0}) #OpenSSL::SSL::VERIFY_NONE}) #,
             #"User-Agent" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17")
        @doc = Nokogiri::HTML(f)
        break
      rescue => e
        p "ERROR "+"("+n.to_s+" de 5) buscando "+url+ " -> error: "+e.message
		sleep(10)
      end
    end
  end

  def movies
    @movies =[]
    titulos =[]
    @doc.xpath('//td[@class = "result_text"]').each  do |node|
                                                       titulos << node.text.split('aka')[0].strip
                                                     end
    refers = []
    @doc.xpath('//td[@class = "result_text"]/a').each  do |node|
                                                         refers << node['href'].split('/')[2]
                                                       end
    for i in 0..(titulos.count - 1)
      if not(titulos[i].include? "TV Episode")
        aux=[]
        aux << titulos[i]
        aux << refers[i]
        @movies << aux
      end
    end
    @movies
  end
  
  def es_serie
	es_serie = false
	serie_text = @doc.xpath('//div[@class="title_wrapper"]').text
	aux = serie_text.split('|')
	if aux[-1].strip.include? "TV Serie"
		es_serie = true
	end 
  
	es_serie
  end

  def title
    title = []
    title_text = @doc.xpath('//div[@class="title_wrapper"]').text
    title_text = title_text.delete("\n").delete("\"").gsub(/[()]/, '|')
    aux = title_text.split('|')
    if aux[3] != "original title"
      aux[2] = aux[0]
    end
    aux[3]=@code

    for i in 0..3
      title << aux[i].strip.force_encoding('UTF-8')
    end

    title
  end

  def title2
    title = []
    title_text = @doc.xpath('//div[@class="title_wrapper"]').text
    title_text = title_text.delete("\n").delete("\"").gsub(/[()]/, '|')
    aux = title_text.split('|')
    if aux[3] != "original title"
      aux[2] = aux[0]
    end
   
	title << sin_C2A0(aux[0]).strip
	title << sin_C2A0(aux[2]).strip
	title << @code

    title
  end

  def title_serie
    title = []
    title << @doc.xpath('//div[@class="title_wrapper"]/h1').text.strip
	title_text = @doc.xpath('//div[@class="title_wrapper"]/div[@class="originalTitle"]').text.split('(')[0]
	if title_text.nil? 
		title << title[0]
	else
		title << title_text.strip 
	end
	title << @code
	
    title
  end

  def anio
    title = []
    title_text = @doc.xpath('//div[@class="title_wrapper"]').text
    title_text = title_text.delete("\n").delete("\"").gsub(/[()]/, '|')
    aux = title_text.split('|')
   
	title << aux[1]

    title

  end

  def anio_serie
	title =	[]
	serie_text = @doc.xpath('//div[@class="title_wrapper"]').text
	aux = serie_text.split('|')
	
	title << aux[-1].split('(')[1].split(')')[0]

	title
  end

  def director
    salida = []
    x_text = @doc.xpath('//div[@class="credit_summary_item"]').text #.delete("\n")
	aux = x_text.split("\n")
	aux.each_with_index do |valor, ind| 
		if valor.include? "Director" 
			aux[ind+1].split(',').each do |name|
				salida << name.delete('|').strip
			end
			break
		end	
	end	 
    salida
  end

  
  
  def genre
    salida = []
	x_text = @doc.xpath('//div[@class="see-more inline canwrap"]').text 
	aux = x_text.split("\n")
	hay = false
	aux.each_with_index do |valor, ind| 
		if hay
			salida << sin_C2A0(valor.delete("|")).strip
			if not valor.include? "|"
				hay = false
			end
		end
		if valor.include? "Genre"
			hay = true		
		end
	end
    salida
  end

  def writer
    salida = []
    x_text = @doc.xpath('//div[@class="credit_summary_item"]').text #.delete("\n")
	aux = x_text.split("\n")
	aux.each_with_index do |valor, ind| 
		if valor.include? "Writer" 
			aux[ind+1].split(',').each do |name|
				salida << name.delete('|').split('(')[0].strip
			end
			break
		end	
	end	 
    salida
  end

  def creator
    salida = []
    x_text = @doc.xpath('//div[@class="credit_summary_item"]').text #.delete("\n")
	aux = x_text.split("\n")
	aux.each_with_index do |valor, ind| 
		if valor.include? "Creator" 
			aux[ind+1].split(',').each do |name|
				salida << name.delete('|').split('(')[0].strip
			end
			break
		end	
	end	 
    salida
  end

  def country
    @country = findTag("Countr")
  end

  def language
    @language = findTag("Language")
  end

  def sound
    @sound = findTag("Sound Mix")
  end

  def color
    @color = findTag('Color')
  end

  def findTag (tag)
    @findTag = []
    @doc.xpath('//div[@class = "txt-block"]').each  do |node|
      line = node.text.delete("\n").strip
      if line.index(tag) == 0
        line = line.gsub(/[:,]/, '|')
        aux = line.split('|')
        for i in 1..(aux.count - 1)
          auxS = aux[i].split('(')[0].strip
          if not auxS.include? " more "
            @findTag << auxS
          end
        end
      end
    end
    @findTag
  end

  def cast
    salida = []
	actor = []
    personaje = []		
    @doc.xpath('//table[@class="cast_list"]//td').each_with_index do |valor, ind| 
		
		if ind % 2 == 0 and ind > 0 and not(ind % 4 == 0)
			actor << valor.text.delete("\n").strip
		end
		if ind > 0 and ind % 4 == 0
			personaje << internalSpaces(valor.text.delete("\n")).split('(')[0].strip  
		end
	end
		
	for i in 0..(actor.count - 1 )
		aux = []
		aux << actor[i]
		aux << personaje[i]
		salida << aux
	end

    salida
  end

  def cast_serie
    salida = []
	actor = []
    personaje = []		
    @doc.xpath('//table[@class="cast_list"]//td').each_with_index do |valor, ind| 
		if valor.to_s.include? '/name/' and not valor.to_s.include? '<img'
			actor << valor.text.delete("\n").strip
		end
		if valor.to_s.include? 'class="character"'
			personaje << valor.text.delete("\n").strip.split('  ')[0]
		end
	end
		
#	puts "actor: #{actor}"
#	puts "personaje: #{personaje}"
	
	for i in 0..(actor.count - 1 )
		aux = []
		aux << actor[i]
		aux << personaje[i]
		salida << aux
	end

    salida
  end

  def poster
    @poster =[]
    @doc.xpath('//div[@class="poster"]/a/img').each do |node|
      @poster << node['src']
    end
    @poster
  end
  
  def json_movie (imdb_obj)
	res = Hash.new
	
	res["imdbcode"] = @code
	res["original title"] = imdb_obj.title2[1]
	res["spanish title"] = imdb_obj.title2[0]
	res["year"] = imdb_obj.anio[0]
	res["director"] = imdb_obj.director
	res["writer"] = imdb_obj.writer
	res["genre"] = imdb_obj.genre
	res["country"] = imdb_obj.country
	res["language"] = imdb_obj.language
	res["sound"] = imdb_obj.sound
	res["color"] = imdb_obj.color
	res["cast"] = imdb_obj.cast
	res["poster"] = imdb_obj.poster[0]

	res.to_json	
	
	
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


