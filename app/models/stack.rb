class Stack < ActiveRecord::Base
  belongs_to :stack_field

  has_and_belongs_to_many :users
  has_and_belongs_to_many :services
end
