class ServiceStack < ActiveRecord::Base
  belongs_to :service
  belongs_to :stack
  # resourcify
end
