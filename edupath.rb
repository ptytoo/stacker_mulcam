require 'nokogiri'
require 'json'
require 'open-uri'
require 'awesome_print'
require 'rest-client'
require 'httparty'
require 'csv'
require 'pry'

# $stack_name = ["Languages", "Database"]

File.open("edu_path.csv", "w") do |file|
  file.write("")
end

DATA.each do |stack|
  url = URI.encode "https://hackr.io/tutorials/learn-#{stack.strip}"
  res = HTTParty.get(url)
  text = Nokogiri::HTML(res.body)

  result = []
  contents = text.css('.tut-list.tut-row .title-links a')
  contents.each do |content|
    link = content['href']
    result << link
  end

  edu_links = []
    result.each do |url|
      res = HTTParty.get(url)
      text = Nokogiri::HTML(res.body)
      contents = text.css('a.btn-visit-tut')
      contents.each do |content|
        link = content['href']
        edu_links << link
      end
      puts edu_links
    end

    File.open("edu_path.csv", "a") do |file|
      file.write(result2.join("@@$^").gsub(/,\s+\"/,',\"'))
      file.write("\n")
      end

end

__END__
android-development
angular
apache-spark
asp-net
backbone-js
bootstrap
c
c-sharp
c-plus-plus
