class CompanyField < ActiveRecord::Base
  has_many :companies
  resourcify
end
