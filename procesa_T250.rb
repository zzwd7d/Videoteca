#=> #<Encoding:UTF-8>

require 'open-uri'
require 'nokogiri'
require "active_record"
require './models/coleccion'

require "json"
require "Date"

@config = YAML.load_file("config.yml")

ActiveRecord::Base.establish_connection(
  :adapter  => @config["base"]["adapter"],
  :host     => @config["base"]["host"], 
  :port     => @config["base"]["port"],
  :username => @config["base"]["username"],
  :password => @config["base"]["password"],
  :database => @config["base"]["dbname"]
)

url = "https://www.imdb.com/chart/top/?ref_=nv_mv_250"
(1..5).each do |n|
    begin
        f = open(url,{ssl_verify_mode: 0}) #OpenSSL::SSL::VERIFY_NONE}) #,
             #"User-Agent" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17")
        @doc = Nokogiri::HTML(f)
        break
     rescue => e
        puts "ERROR "+"("+n.to_s+" de 5) buscando "+url+ " -> error: "+e.message
	    sleep(10)
    end
end

refers =[]

@doc.xpath('//td[@class = "titleColumn"]/a').each do |node|
												     refers << node['href'].split('/')[2]
												  end

if refers.size > 0
	Coleccion.delete(:coleccion_code => 'T250')
	n=0
	refers.each do |uno|
		p = Coleccion.new
		p.coleccion_code = 'T250'
		p.imdb_code = uno
		p.save
		n += 1
	end
	puts "#{Date.today.to_s} - Se grabaron #{n} registros"
else
	puts "#{Date.today.to_s} - Algo anduvo mal"
end
 


