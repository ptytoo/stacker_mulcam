require 'nokogiri'
require 'json'
require 'open-uri'
require 'awesome_print'
require 'rest-client'
require 'httparty'
require 'csv'
require 'pry'

$stack_name = []


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
  puts result

  result2 = []
    result.each do |url|
      res = HTTParty.get(url)
      text = Nokogiri::HTML(res.body)
      contents = text.css('a.btn-visit-tut')
      contents.each do |content|
        link = content['href']
        result2 << link
      end
      puts result2
    end

    File.open("edu_path.csv", "a") do |file|
      9.times do |i|
        file.write(result[$stack_name[i]].join(','))
        file.write("\n")
      end

end

__END__
android-development
