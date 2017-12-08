require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist
Capybara.run_server = false

module GetPrice
  class WebScraper
    include Capybara::DSL
    def get_page_data(url)
      visit(url)
      doc = Nokogiri::HTML(page.html)
      for i in 1..4 do
      contents = doc.css('body > div.container > div > div > div > div:nth-child(2) > div:nth-child('+ "#{i}"+') > div.panel-footer > div')
          contents.each do |content|
            arr = content['title']
            unless arr=='0'
              puts arr
            end
          end
      end
      for i in 1..5 do
      contents = doc.css('body > div.container > div > div > div > div:nth-child(3) > div:nth-child('+ "#{i}"+') > div.panel-footer > div')
          contents.each do |content|
            arr = content['title']
            unless arr=='0'
              puts arr
            end
          end
      end
    end
  end
end



scraper = GetPrice::WebScraper.new
scraper.get_page_data('http://techstacks.io/').to_s.inspect
