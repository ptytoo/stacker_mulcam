class StackField < ActiveRecord::Base
  has_many :stacks
  resourcify
end
