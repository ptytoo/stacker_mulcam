require 'nokogiri'
require 'json'
require 'open-uri'
require 'awesome_print'
require 'rest-client'
require 'httparty'
require 'csv'


# File.open("com1.csv", "w") do |file|
#   file.write("")
# end


#File.open("test.csv", "w") do |file|
#  file.write("")
#end

DATA.each do |name|
  url = URI.encode "https://www.rocketpunch.com/companies/#{name}"
  res = HTTParty.get(url)
  text = Nokogiri::HTML(res.body)
  # content = text.css('#company-stacks').text
  # if content.empty?
  #   puts "#{name} 없음"
  # else
  #   puts "#{name}"
  # end
  # puts content
  #name = text.css('#company-header .name strong').text
  #logo_url = text.css(".ui.large.logo img")[0]["src"]
  #site_url = text.css('#company-info > div.ui.top.attached.segment > div > div:nth-child(3) > div.content').text
  site_url = text.css(".content a")[2]["href"]
  #describe = text.css('#company-overview').text
  #service = text.css('#company-products > div:nth-child(2) > div.ui.items > div > div.content > div.overview').text

  result = Array.new
  #result << name
  #result << url
  #result << logo_url
  #result << describe
  #result << service
  result << site_url


  # content.split("\n").each do |line|
  #   l = line.strip
  #   if l.length > 0
  #     #l = "AAA"
  #     result << l
  #   end
  # end
  File.open(".csv", "a") do |file|
    file.write(result.join("@@$^").gsub(/,\s+\"/,',\"'))
    file.write("\n")
  end

end

__END__
seerslab
sualab
jobisnv
seworks
gaudio
bluenight
studioxidkorea
omnious
loplat
swingvy
xbrain
