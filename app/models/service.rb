class Service < ActiveRecord::Base
  belongs_to :company

  has_and_belongs_to_many :stacks
  mount_uploader :logo_url, ServiceLogoUploader
end
