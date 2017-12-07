class Company < ActiveRecord::Base
  belongs_to :company_field
  has_many :services
end
