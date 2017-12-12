class Company < ActiveRecord::Base
  belongs_to :company_field
  has_many :services
  resourcify
  #mount_uploader :logo_url, CompanyLogoUploader
end
