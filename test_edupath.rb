require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'csv'
require 'pry'
require 'open_uri_redirections'

Capybara.default_driver = :poltergeist
Capybara.run_server = false


File.open('edu_path.csv', 'w') do |file|
  file.write("")
end


module GetPrice
  class WebScraper
    include Capybara::DSL
    def get_page_data(url)
      visit(url)
      doc = Nokogiri::HTML(page.html)

      result = Array.new
      for i in 2..10 do
      contents = doc.css('body > div.page-wrapper > div > div.page--section-body.tutorial--tut-list > div > div > div > div.flex-container > div.main--content.col-xs-12.col-sm-12.col-md-9.no-padding > div.js-tutorial-listing-content > div.main-content.border > div.tutorial-listing-wrapper > div.tutorial-listing > div:nth-child('+"#{i}"+') > div.tut-list-primary > div.tut-title > div.title > div > a')
          contents.each do |content|
            link = content['href']
            # unless link == '0'
            #   result << link
            # end
            result << link
            puts result
          end
      # end
      # result_hash = Hash.new
      # 9.times do |i|
      #   name = $field_name[i]
      #   result_hash[name] = result[i*5..i*5+4]
      end
      # return result
    end
  end
end


    scraper = GetPrice::WebScraper.new
    result = scraper.get_page_data("https://hackr.io/tutorials/learn-android-development")
    # File.open("edu_path.csv", "a") do |file|
    #   # 9.times do |i|
    #   #   file.write(result[$field_name[i]].join(','))
    #   #   file.write("\n")
    # end
