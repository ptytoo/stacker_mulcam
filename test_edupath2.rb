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

DATA.each do |name|
  url = URI.encode "https://hackr.io/tutorials/#{name}"
  res = HTTParty.get(url)
  text = Nokogiri::HTML(res.body)
  # content = text.css('#company-stacks').text
  # if content.empty?
  #   puts "#{name} 없음"
  # else
  #   puts "#{name}"
  # end
  # puts content

  logo_url = text.css(".ui.large.logo img")[0]["src"]

  result = Array.new
  result << logo_url
  #result << service


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
