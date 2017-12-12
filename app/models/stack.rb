class Stack < ActiveRecord::Base
  belongs_to :stack_field

  has_and_belongs_to_many :users
  has_and_belongs_to_many :services
  resourcify

  has_many :impressions, :as=>:impressionable

  def impression_count
      impressions.size
  end

  def unique_impression_count
      # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
      # so getting keys from the hash and calculating the number of keys
      impressions.group(:ip_address).size.keys.length #TESTED
  end

end
