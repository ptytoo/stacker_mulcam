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
      result = {'1' => result[0..4], '2' => result[5..9],
                      '3' => result[10..14], '4' => result[15..19],
                      '5' => result[20..24], '6' => result[25..29],
                    '7' => result[30..34], '8' => result[35..39], '9'=> result[40..44]}
        return result
    end
  end
end

scraper = GetPrice::WebScraper.new
result = scraper.get_page_data('http://techstacks.io/')



File.open("trendstack.csv", "a") do |file|

 for i in 1..9
    file.write(result["#{i}"].join(','))
    file.write("\n")
 end
end


# reuslt <<
#

# map(&:text).inspect
