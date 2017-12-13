require 'nokogiri'
require 'json'
require 'open-uri'
require 'awesome_print'
require 'rest-client'
require 'httparty'
require 'csv'
require 'pry'

$stack_name = ["android-development","angular","apache-spark","asp-net","backbone-js","bootstrap","c","c-sharp","c-plus-plus","cassandra","django","elasticsearch","elixir","flask","git","go","haskell","html-5","ios-swift","java","java-spring-framework","javascript","jquery","kotlin","mongodb","mysql","nginx","node-js","php","polymer","python","react","redis","rust","sass","scala","sql-server","typescript","visual-basic-vb","vue-js","couchdb","elm","ember-js","erlang","less","lua","objective-c","postgres","meteor","ruby","ruby-on-rails"]

$stack_name.each_with_index do |stack_name, index|
# DATA.each do |stack|
  url = URI.encode "https://hackr.io/tutorials/learn-#{stack_name.to_s.strip.gsub(/,\s+\"/,',\"')}"
  res = HTTParty.get(url)
  text = Nokogiri::HTML(res.body)

  result = []
  contents = text.css('.tut-list.tut-row .title-links a')
  contents.each do |content|
    link = content['href']
    result << link
  end

  edu_links = []
    result.each do |url|
      res = HTTParty.get(url)
      text = Nokogiri::HTML(res.body)
      contents = text.css('a.btn-visit-tut')
      contents.each do |content|
        link = content['href']
        edu_links << link
      end
      # puts edu_links
    end


    File.open("edu_path.csv", "a") do |file|
    # $stack_name.each_with_index do |stack_name, index|
        file.write(stack_name)
        file.write("@@$^")
        file.write(edu_links.join(",").gsub(/,\s+\"/,',\"'))
        file.write("\n")
    # end
    end
end


# __END__
# 목요일에 시간 되면 여기 아래 스택들 추가하면 좋을듯 해요 (교육사이트 자료가 있어서)
# clojure
# d3-js
# docker
# graphql
# gulp
# hadoop-big-data
# codeigniter
# julia
# chef
# grunt
# unity
# jenkins
# kubernetes
# laravel
# coffeescript
# dart
# sinatra
