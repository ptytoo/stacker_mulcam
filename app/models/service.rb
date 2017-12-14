class Service < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_and_belongs_to_many :stacks
  #mount_uploader :logo_url, ServiceLogoUploader
  has_many :impressions, :as=>:impressionable
  resourcify

   def impression_count
       impressions.size
   end

   def unique_impression_count
       # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
       # so getting keys from the hash and calculating the number of keys
       impressions.group(:ip_address).size.keys.length #TESTED
   end

   def client
     send("#{provider}_client") # metaprogramming
   end

   def facebook_client
     Koala::Facebook::API.new(access_token)
   end

   def access_token
     if expires_at? && expires_at <= Time.zone.now
       new_token_info = Koala::Facebook::OAuth.new.exchange_access_token_info(super)
       update(
         access_token: new_token_info["access_token"],
         expires_at: Time.zone.now + new_token_info["expires_in"]
    )
    end
    super
  end

end
