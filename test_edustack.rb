require 'nokogiri'
require 'json'
require 'open-uri'
require 'awesome_print'
require 'rest-client'
require 'httparty'
require 'csv'
require 'pry'

# $stack_name = ["Languages", "Database"]
#
# File.open("edu_stack.csv", "w") do |file|
#   file.write("")
# end
#
# 
#   url = URI.encode "https://hackr.io/"
#   res = HTTParty.get(url)
#   text = Nokogiri::HTML(res.body)
#
#   result = []
#   contents = text.css('.topic-grid a')
#   contents.each do |content|
#     stack_name = content['.p']
#     result << stack_name
#   end
#   puts result
#
#     File.open("edu_stack.csv", "a") do |file|
#       file.write(result.join("@@$^").gsub(/,\s+\"/,',\"'))
#       file.write("\n")
#       end
