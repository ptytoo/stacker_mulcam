# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# c_field_list = ["Social media/Communication","Edu Tech","Utility","Fintech","Game",
# "E-Commerce","Foodtech","Contents","Healthcare","Ad/Marketing","IoT","Analytics","Sharing Economy"]
# c_field_list.each do |field|
#   CompanyField.create(
#       name: field
#   )
# end
#
#
#
# s_field_list = ["Language","Database","Server","Front-end","Native_App","Etc"]
# s_field_list.each do |field|
#   s = StackField.create(
#       name: field
#   )
#
#
# end
#
#
#
require 'csv'

File.open(Rails.root.join('seed_data_company/fintech.csv'), "r") do |file|
  row = file.read.split("@@$^")
  company = Company.create(
    name: row[0].to_s.downcase,
    site_url: row[1],
    logo_url: row[2],
    describe: row[3],
    company_field_id: 4
  )
  puts company.inspect
end
<<<<<<< HEAD
#
#
#
# CSV.foreach(Rails.root.join('seed_data_stack/language_stack.csv')) do |row|
#   Stack.create(
#     name: row[0].to_s.downcase,
#     site_url: row[1],
#     short_describe: row[2],
#     describe: row[3],
#     version: row[4],
#     stack_field_id: 1
#   )
# end

# CSV.foreach(Rails.root.join('seed_data_stack/db_stack.csv')) do |row|
#   Stack.create(
#     name: row[0].to_s.downcase,
#     site_url: row[1],
#     short_describe: row[2],
#     describe: row[3],
#     version: row[4],
#     stack_field_id: 2
#   )
# end
#
# CSV.foreach(Rails.root.join('seed_data_stack/server_stack.csv')) do |row|
#   Stack.create(
#     name: row[0].to_s.downcase,
#     site_url: row[1],
#     short_describe: row[2],
#     describe: row[3],
#     version: row[4],
#     stack_field_id: 3
#   )
# end
#
# CSV.foreach(Rails.root.join('seed_data_stack/frontend_stack.csv')) do |row|
#   Stack.create(
#     name: row[0].to_s.downcase,
#     site_url: row[1],
#     short_describe: row[2],
#     describe: row[3],
#     version: row[4],
#     stack_field_id: 4
#   )
# end
#
# CSV.foreach(Rails.root.join('seed_data_stack/app_stack.csv')) do |row|
#   Stack.create(
#     name: row[0].to_s.downcase,
#     site_url: row[1],
#     short_describe: row[2],
#     describe: row[3],
#     version: row[4],
#     stack_field_id: 5
#   )
# end
#
#
# CSV.foreach(Rails.root.join('seed_data_stack/etc_stack.csv')) do |row|
#   Stack.create(
#     name: row[0].to_s.downcase,
#     site_url: row[1],
#     short_describe: row[2],
#     describe: row[3],
#     version: row[4],
#     stack_field_id: 6
#   )
# end
#
# require 'nokogiri'
# require 'json'
# require 'awesome_print'
#
# #rails g model git_trend
# arr = Array.new
# File.open("gitdata.json", "r").each_line do |row|
#   arr << JSON.parse(row)
# end
# arr[0..10].each do |a|
#   Gittrend.create(
#     name: a["name"],
#     year: a["year"],
#     quarter: a["quarter"],
#     count: a["count"]
#   )
# end
=======



CSV.foreach(Rails.root.join('seed_data_stack/language_stack.csv')) do |row|
  Stack.create(
    name: row[0].to_s.downcase,
    site_url: row[1],
    short_describe: row[2],
    describe: row[3],
    version: row[4],
    stack_field_id: 1
  )
end

CSV.foreach(Rails.root.join('seed_data_stack/db_stack.csv')) do |row|
  Stack.create(
    name: row[0].to_s.downcase,
    site_url: row[1],
    short_describe: row[2],
    describe: row[3],
    version: row[4],
    stack_field_id: 2
  )
end

CSV.foreach(Rails.root.join('seed_data_stack/server_stack.csv')) do |row|
  Stack.create(
    name: row[0].to_s.downcase,
    site_url: row[1],
    short_describe: row[2],
    describe: row[3],
    version: row[4],
    stack_field_id: 3
  )
end

CSV.foreach(Rails.root.join('seed_data_stack/frontend_stack.csv')) do |row|
  Stack.create(
    name: row[0].to_s.downcase,
    site_url: row[1],
    short_describe: row[2],
    describe: row[3],
    version: row[4],
    stack_field_id: 4
  )
end

CSV.foreach(Rails.root.join('seed_data_stack/app_stack.csv')) do |row|
  Stack.create(
    name: row[0].to_s.downcase,
    site_url: row[1],
    short_describe: row[2],
    describe: row[3],
    version: row[4],
    stack_field_id: 5
  )
end


CSV.foreach(Rails.root.join('seed_data_stack/etc_stack.csv')) do |row|
  Stack.create(
    name: row[0].to_s.downcase,
    site_url: row[1],
    short_describe: row[2],
    describe: row[3],
    version: row[4],
    stack_field_id: 6
  )
end

require 'nokogiri'
require 'json'
require 'awesome_print'

#rails g model gittrend name year quarter count
arr = Array.new
File.open("gitdata.json", "r").each_line do |row|
  arr << JSON.parse(row)
end
arr[0..10].each do |a|
  Gittrend.create(
    name: a["name"],
    year: a["year"],
    quarter: a["quarter"],
    count: a["count"]
  )
end
>>>>>>> 4b60a18bc6ac4baf7298f69e459aaffe50e4385b
