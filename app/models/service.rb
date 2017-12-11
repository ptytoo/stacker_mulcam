class Service < ActiveRecord::Base
  belongs_to :company

  has_and_belongs_to_many :stacks
  #mount_uploader :logo_url, ServiceLogoUploader
<<<<<<< HEAD

  has_many :impressions, :as=>:impressionable

   def impression_count
       impressions.size
   end

   def unique_impression_count
       # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
       # so getting keys from the hash and calculating the number of keys
       impressions.group(:ip_address).size.keys.length #TESTED
   end

=======
  has_many :impressions, :as=>:impressionable

  def impression_count
      impressions.size
  end

  def unique_impression_count
      # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
      # so getting keys from the hash and calculating the number of keys
      impressions.group(:ip_address).size.keys.length #TESTED
  end
>>>>>>> 101d073493a116b891604eae085b0593872b642f
end
