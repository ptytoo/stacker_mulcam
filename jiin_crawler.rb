require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'csv'
require 'pry'

Capybara.default_driver = :poltergeist
Capybara.run_server = false


File.open('trendstack.csv', 'w') do |file|
  file.write("")
end

module GetPrice
  class WebScraper
    include Capybara::DSL
    def get_page_data(url)
      visit(url)
      doc = Nokogiri::HTML(page.html)
      result = Array.new
      for i in 2..3 do
      contents = doc.css('body > div.container > div > div > div > div:nth-child('+"#{i}"+') > div > div.panel-footer > div')
          contents.each do |content|
            title = content['title']

            unless title=='0'
              result << title
            end
          end
      end
      # binding.pry
      # puts result
      return result
    end
  end
end

scraper = GetPrice::WebScraper.new
result = scraper.get_page_data('http://techstacks.io/')



File.open("trendstack.csv", "a") do |file|
  file.write(result.join(","))
  file.write("\n")
end


# reuslt <<
#

# map(&:text).inspect
