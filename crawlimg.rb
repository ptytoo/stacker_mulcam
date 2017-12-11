require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'csv'
require 'pry'

Capybara.default_driver = :poltergeist
Capybara.run_server = false


File.open('trendurl.csv', 'w') do |file|
  file.write("")
end

module GetPrice
  class WebScraper
    include Capybara::DSL
    def get_page_data(url)
      visit(url)
      doc = Nokogiri::HTML(page.html)
      result=Array.new
      for i in 1..5
        contents = doc.css('body > div.container > div > div > div > div:nth-child(2) > div > div.panel-footer > div:nth-child('+"#{i}"+') > a > img')
        contents.each do |content|
        src = content['src']
        result << src

        end
      end
      for i in 1..5
        contents = doc.css('body > div.container > div > div > div > div:nth-child(3) > div > div.panel-footer > div:nth-child('+"#{i}"+') > a > img')
        contents.each do |content|
        src = content['src']
        result << src
        end
      end

      return result
    end
  end
end



scraper = GetPrice::WebScraper.new
result = scraper.get_page_data('http://techstacks.io/')

  File.open("trendurl.csv", "a") do |file|
      file.write(result.join(','))
      file.write("\n")
  end
