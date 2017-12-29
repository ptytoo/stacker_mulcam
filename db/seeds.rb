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

##################################   회사 데이터   #################################

company_data =
['seed_data_company/sm-commu.csv',
'seed_data_company/edtech.csv',
'seed_data_company/utility.csv',
'seed_data_company/fintech.csv',
'seed_data_company/game.csv',
'seed_data_company/e-commerce.csv',
'seed_data_company/foodtech.csv',
'seed_data_company/contents.csv',
'seed_data_company/healthcare.csv',
'seed_data_company/ad_marketing.csv',
'seed_data_company/IoT.csv',
'seed_data_company/analytics.csv',
'seed_data_company/sharing_economy.csv'
]

company_data.each_with_index do |file_name, index|
  text = File.open(Rails.root.join(file_name)).read
  text.each_line do |line|
    data = line.split("@@$^")
      Company.create(
      name: data[0].to_s.downcase,
      site_url: data[1],
      logo_url: data[2],
      describe: data[3],
      company_field_id: (index + 1) ##이 부분 수정
    )
  end
end

#################################   서비스 데이터   ################################

service_data =
[
'seed_data_service/contentss.csv',
'seed_data_service/e-commerces.csv',
'seed_data_service/edtechs.csv',
'seed_data_service/fintechs.csv',
'seed_data_service/foodtechs.csv',
'seed_data_service/games.csv',
'seed_data_service/healthcares.csv',
'seed_data_service/IoTs.csv',
'seed_data_service/sharing_economies.csv',
'seed_data_service/sm-commus.csv',
'seed_data_service/utilitys.csv',
'seed_data_service/ad_marketings.csv',
'seed_data_service/analyticss.csv'
]

service_data.each do |file_name|
  text = File.open(Rails.root.join(file_name)).read
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
end

#################################  스택 데이터   ################################

stack_data =
[
'seed_data_stack/language_stack.csv',
'seed_data_stack/db_stack.csv',
'seed_data_stack/server_stack.csv',
'seed_data_stack/frontend_stack.csv',
'seed_data_stack/app_stack.csv',
'seed_data_stack/etc_stack.csv'
]

stack_data.each_with_index do |file_name, index|
  CSV.foreach(Rails.root.join(file_name)) do |row|
    Stack.create(
      name: row[0].to_s.downcase,
      site_url: row[1],
      short_describe: row[2],
      describe: row[3],
      version: row[4],
      stack_field_id: (index+1)
    )
  end
end

##############################   서비스 스택 데이터   ################################

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
    service = Service.where('lower(name) = ? ', data[0].downcase.strip).first
    # puts data[0]
    # puts service.inspect
    if service.present?
      data[1].split(",").each do |stack_name|
        stack = Stack.where('lower(name) = ?', stack_name.downcase.strip).first
        if stack.present?
          ServiceStack.create(
            service_id: service.id,
            stack_id: stack.id
          )
        end
      end
    end
  end
end

#############################   git trend 데이터   ################################

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

##########################   trend_stacks 데이터   ################################

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

#########################   git octo trend 데이터   ################################

CSV.foreach(Rails.root.join('octo_trends.csv')) do |row|
  OctoTrend.create(
    table_id: row[0],
    table_title: row[1],
    content_name: row[2],
    content_figure: row[3]
  )
end

##############################   edu path 데이터   ################################

# stack_name =
# ["android-developmen","angular","apache-spark","asp-net","backbone-js","bootstrap",
#   "c","c-sharp","c-plus-plus","cassandra","django","elasticsearch","elixir","flask",
#   "git","go","haskell","html-5","ios-swift","java","java-spring-framework","javascript",
#   "jquery","kotlin","mongodb","mysql","nginx","node-js","php","polymer","python","react",
#   "redis","rust","sap-abap","sass","scala","sql-server","typescript","visual-basic-vb",
#   "vue-js","couchdb","elm","ember-js","erlang","less","lua","objective-c","postgres","meteor","ruby","ruby-on-rails"]


# stack_name.each do |stack_name|
    text = File.open(Rails.root.join('edu_path.csv')).read
    text.each_line do |line|
      data = line.split("@@$^")
      stack = Stack.where('lower(name) = ? ', data[0].downcase.strip).first
      # puts data[0]
      # puts stack.inspect
      if stack.present?
        data[1].split(",").each do |link|
          # if stack.present?
            EduPath.create(
              stack_id: stack.id,
              url: link
            )
        end
      end
    end
# end
