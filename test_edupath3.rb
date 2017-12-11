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

DATA.each do |stack|
  url = URI.encode "https://hackr.io/tutorials/learn-#{stack}"
  res = HTTParty.get(url)
  text = Nokogiri::HTML(res.body)

    result = Array.new
    for i in 2..5 do
      contents = text.css('body > div.page-wrapper > div > div.page--section-body.tutorial--tut-list > div > div > div > div.flex-container > div.main--content.col-xs-12.col-sm-12.col-md-9.no-padding > div.js-tutorial-listing-content > div.main-content.border > div.tutorial-listing-wrapper > div.tutorial-listing > div:nth-child('+"#{i}"+') > div.tut-list-primary > div.tut-title > div.title > div > a')

      contents.each do |content|
        link = content['href']

        result << link
        puts result
      end
    end

end

__END__
android-development
angular
