<<<<<<< HEAD
class Service < ActiveRecord::Base
  belongs_to :company

  has_and_belongs_to_many :stacks
  #mount_uploader :logo_url, ServiceLogoUploader
end
=======
class Service < ActiveRecord::Base
  belongs_to :company

  has_and_belongs_to_many :stacks
  mount_uploader :logo_url, ServiceLogoUploader
end
>>>>>>> 50881949e75ceb991a00f58c867b3c8bddc84695
