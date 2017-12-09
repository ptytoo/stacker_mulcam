# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c_field_list = ["Social media/Communication","Edu Tech","Utility","Fintech","Game",
"E-Commerce","Foodtech","Contents","Healthcare","Ad/Marketing","IoT","Analytics","Sharing Economy"]
c_field_list.each do |field|
  CompanyField.create(
      name: field
  )
end



s_field_list = ["Language","Database","Server","Front-end","Native_App","Etc"]
s_field_list.each do |field|
  s = StackField.create(
      name: field
  )
end


t_field_list = ["Programming Language", "Client Libraries", "HTTP Server Technologies", "Server Libraries", "Databases and NoSQL Datastores", "Server Software", "Operating Systems", "Cloud/Hardware Infrastructure", "3rd Party APIs/Services"]
t_field_list.each do |field|
   StackTrend.create(
     type_id: 
     type_name: field
     stack_name:
  )
end


require 'csv'

text = File.open(Rails.root.join('seed_data_company/sm-commu.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 1
  )
end

text = File.open(Rails.root.join('seed_data_company/edtech.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 2
  )
end

text = File.open(Rails.root.join('seed_data_company/utility.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 3
  )
end

text = File.open(Rails.root.join('seed_data_company/fintech.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 4
  )
end

text = File.open(Rails.root.join('seed_data_company/e-commerce.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 6
  )
end

text = File.open(Rails.root.join('seed_data_company/foodtech.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 7
  )
end

text = File.open(Rails.root.join('seed_data_company/contents.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 8
  )
end

text = File.open(Rails.root.join('seed_data_company/healthcare.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 9
  )
end

text = File.open(Rails.root.join('seed_data_company/ad_marketing.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 10
  )
end

text = File.open(Rails.root.join('seed_data_company/IoT.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 11
  )
end

text = File.open(Rails.root.join('seed_data_company/analytics.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 12
  )
end

text = File.open(Rails.root.join('seed_data_company/sharing_economy.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 13
  )
end


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
