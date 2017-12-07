class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :stacks

  def admin?
     if role == "admin"
       true
     else
       false
     end
   end

   def enter?
     if role == "enter"
       true
     else
       false
     end
   end

   def indi?
     if role == "indi"
       true
     else
       false
     end
   end
end
