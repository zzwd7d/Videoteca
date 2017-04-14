class IMDB2
  # To change this template use File | Settings | File Templates.
  require 'open-uri'
  require 'nokogiri'

  def initialize (tipo, dato )
    p dato
    @code = dato.strip.gsub(/ /,'+')
    if tipo == 'list'
      url = "http://www.imdb.com/find?q=" + @code + "&s=tt"
    else
      url = "http://www.imdb.com/title/" + dato
    end
    (1..5).each do |n|
      begin
        f = open(url,
             "User-Agent" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17")
        @doc = Nokogiri::HTML(f)
        break
      rescue => e
        p "ERROR "+"("+n.to_s+" de 5) buscando "+url+ " -> error: "+e.message
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

  def title
    @title = []
    title_text = @doc.xpath('//div[@class="title_wrapper"]').text
    title_text = title_text.delete("\n").delete("\"").gsub(/[()]/, '|')
    aux = title_text.split('|')
    #x = aux.delete("original title")
    #if aux.count == 2
    #  aux << aux[0]
    #end
    #p aux
#    if aux[2].strip == ""
    if aux[3] != "original title"
      aux[2] = aux[0]
    end
    aux[3]=@code

    for i in 0..3
      @title << aux[i].strip
    end

    @title

  end

  def director
    @director = []
    title_text = @doc.xpath('//span[@itemprop="director"]').text.delete("\n")
    if  title_text != ""
 #     aux = title_text.split(':')
      aux2 = title_text.split(',')
 #     aux2 = aux[1].split(',')
      for i in 0..aux2.count - 1
        if not aux2[i].include? " more "
          @director << aux2[i].strip
        end
      end
    end
    @director
  end

  def genre
    @genre = []
    title_text = @doc.xpath('//div[@itemprop="genre"]').text.delete("\n")
    if title_text != ""
      aux = title_text.split(':')
      aux2 = aux[1].split('|')
      for i in 0..aux2.count - 1
        @genre << aux2[i].delete("\u00A0").strip
      end
    else
      @genre << "No Genre"
    end
    @genre
  end

  def writer
    @writer = []
    title_text = @doc.xpath('//div[@class="credit_summary_item"]/span[@itemprop="creator"]').text.delete("\n")
    if  title_text != ""
 #     aux = title_text.split(':')
      aux2 = title_text.split(',')
 #     aux2 = aux[1].split(',')
      for i in 0..aux2.count - 1
        if not aux2[i].include? " more "
          @writer << aux2[i].strip
        end
      end
    end
    @writer
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
    @cast = []
    actor =[]
    @doc.xpath('//td[@itemprop="actor"]').each  do |node|
        actor << node.text.delete("\n").strip
    end

    personaje = []
    @doc.xpath('//td[@class = "character"]').each  do |node|
       personaje << internalSpaces(node.text.delete("\n").split('(')[0].strip)
    end

    for i in 0..(actor.count - 1 )
      aux = []
      aux << actor[i]
      aux << personaje[i]
      @cast << aux
    end

    @cast
  end

  def poster
    @poster =[]
    @doc.xpath('//div[@class="poster"]/a/img').each do |node|
      @poster << node['src']
    end
    @poster
  end

  def internalSpaces(txt)
    while txt.include? "  "
      txt = txt.gsub("  "," ")
    end
    txt
  end
end


