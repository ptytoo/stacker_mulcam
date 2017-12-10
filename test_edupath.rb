require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'csv'
require 'pry'

Capybara.default_driver = :poltergeist
Capybara.run_server = false


# $field_name = ['Programming Languages','Client Libraries','HTTP Server Technologies',
#   'Server Libraries','Databases and NoSQL Data','Server Software','Oprerationg Systems',
#   'Cloud/Hardware Infrastructure','3rd Party APIs/Services']


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
      # for i in 2..3 do
      contents = doc.css('body > div.page-wrapper > div > div.page--section-body.tutorial--tut-list > div > div > div > div.flex-container > div.main--content.col-xs-12.col-sm-12.col-md-9.no-padding > div.js-tutorial-listing-content > div.main-content.border > div.tutorial-listing-wrapper > div.tutorial-listing > div:nth-child(2) > div.tut-list-primary > div.tut-title > div.title > div > a')
          contents.each do |content|
            link = content['href']
            # unless title=='0'
            #   result << title
            # end
            puts link
          end
      # end
      result_hash = Hash.new
      # 9.times do |i|
      #   name = $field_name[i]
      #   result_hash[name] = result[i*5..i*5+4]

      end

      return result_hash
    end
  end
end

scraper = GetPrice::WebScraper.new
result = scraper.get_page_data('https://hackr.io/tutorials/learn-android-development')

File.open("edu_path.csv", "a") do |file|
  # 9.times do |i|
  #   file.write(result[$field_name[i]].join(','))
  #   file.write("\n")
  end
end
