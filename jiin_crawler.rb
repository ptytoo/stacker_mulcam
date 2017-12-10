require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'csv'
require 'pry'

Capybara.default_driver = :poltergeist
Capybara.run_server = false


$field_name = ['Programming Languages','Client Libraries','HTTP Server Technologies',
  'Server Libraries','Databases and NoSQL Data','Server Software','Oprerationg Systems',
  'Cloud/Hardware Infrastructure','3rd Party APIs/Services']


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
      result_hash = Hash.new
      9.times do |i|
        name = $field_name[i]
        result_hash[name] = result[i*5..i*5+4]
      end

      return result_hash
    end
  end
end



scraper = GetPrice::WebScraper.new
result = scraper.get_page_data('http://techstacks.io/')

File.open("trendstack.csv", "a") do |file|
  9.times do |i|
    file.write(result[$field_name[i]].join(','))
    file.write("\n")
  end
end
