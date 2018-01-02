class Service < ActiveRecord::Base
  belongs_to :company

  #has_and_belongs_to_many :stacks
  #mount_uploader :logo_url, ServiceLogoUploader

  has_many :impressions, :as=> :impressionable

  has_many :services, through: :service_stacks
  has_many :services_stack

   def impression_count
       impressions.size
   end

   def unique_impression_count
       # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
       # so getting keys from the hash and calculating the number of keys
       impressions.group(:ip_address).size.keys.length #TESTED
   end
end
