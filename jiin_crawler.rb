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
      doc.css('td.col2 span')
    end
  end
end

scraper = GetPrice::WebScraper.new
puts scraper.get_page_data('https://web.apps.markit.com/WMXAXLP?YYY2220_zJkhPN/sWPxwhzYw8K4DcqW07HfIQykbYMaXf8fTzWT6WKnuivTcM0W584u1QRwj').map(&:text).inspect
