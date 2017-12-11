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

text = File.open(Rails.root.join('seed_data_company/game.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Company.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_field_id: 5
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

text = File.open(Rails.root.join('seed_data_service/contentss.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/e-commerces.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/edtechs.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/fintechs.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/foodtechs.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/games.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/healthcares.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/IoTs.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/sharing_economies.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/sm-commus.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/utilitys.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/ad_marketings.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
  )
end

text = File.open(Rails.root.join('seed_data_service/analyticss.csv')).read
text.each_line do |line|
  data = line.split("@@$^")
    Service.create(
    name: data[0].to_s.downcase,
    site_url: data[1],
    logo_url: data[2],
    describe: data[3],
    company_id: data[4]
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

#
# text = File.open(Rails.root.join('seed_data_service_stack/admarkets.csv')).read
# text.each_line do |line|
#   data = line.split("@@$^")
#     ServiceStack.create(
#     service_id: data[0],
#     stack_id: data[1]
#   )
# end
#
# text = File.open(Rails.root.join('seed_data_service_stack/anal.csv')).read
# text.each_line do |line|
#   data = line.split("@@$^")
#     ServiceStack.create(
#     service_id: data[0],
#     stack_id: data[1]
#   )
# end
#
# text = File.open(Rails.root.join('seed_data_service_stack/conte.csv')).read
# text.each_line do |line|
#   data = line.split("@@$^")
#     ServiceStack.create(
#     service_id: data[0],
#     stack_id: data[1]
#   )
# end
#
# text = File.open(Rails.root.join('seed_data_service_stack/e-comme.csv')).read
# text.each_line do |line|
#   data = line.split("@@$^")
#     ServiceStack.create(
#     service_id: data[0],
#     stack_id: data[1]
#   )
# end
require 'pry'
[ "seed_data_service_stack/admarkets.csv",
  "seed_data_service_stack/anal.csv",
  "seed_data_service_stack/conte.csv",
  "seed_data_service_stack/e-comme.csv",
  "seed_data_service_stack/edu.csv",
  "seed_data_service_stack/fin.csv",
  "seed_data_service_stack/food.csv",
  "seed_data_service_stack/gam.csv",
  "seed_data_service_stack/health.csv",
  "seed_data_service_stack/Io.csv",
  "seed_data_service_stack/shaeco.csv",
  "seed_data_service_stack/sm-com.csv",
  "seed_data_service_stack/util.csv",
].each do |file_name|
  text = File.open(Rails.root.join(file_name)).read
  text.each_line do |line|
    data = line.split("@@$^")
    data[1].split(",").each do |stack_name|
      # puts stack_name
      stack = Stack.where('lower(name) = ?', stack_name.downcase.strip).first

      if stack.present?
        puts "#{data} #{stack.name}"

        ServiceStack.create(
          service_id: data[0],
          stack_id: stack.id
        )
      end
    end
  end
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


field_name = ['Programming Languages','Client Libraries','HTTP Server Technologies',
  'Server Libraries','Databases and NoSQL Data','Server Software','Oprerationg Systems',
  'Cloud/Hardware Infrastructure','3rd Party APIs/Services']


CSV.foreach(Rails.root.join('trendstack.csv')) do |row|
  5.times do |i|
      StackTrend.create(
        type_id: $.-1,
        type_name: field_name[$.-1],
        stack_name: row[i]
      )
  end
end
