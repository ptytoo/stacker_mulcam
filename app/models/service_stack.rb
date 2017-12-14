class ServiceStack < ActiveRecord::Base
  belongs_to :service, :counter_cache => true
  belongs_to :stack
  # resourcify
end
