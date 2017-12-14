class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
           # :omniauthable

  has_and_belongs_to_many :stacks
  validates_uniqueness_of :email
  validates_uniqueness_of :nickname

  validates :nickname, presence: {message: "닉네임을 입력해주세요!"}, length: {maximum: 15, message: "  닉네임이 너무 깁니다!"}, uniqueness: true



    validates :email,
      presence: true,
      format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}


    validates :phone,
      presence: true,
      format: {with: /[0-9]/}



  def interest?(stack)
    
    InterStack.where(user_id: self.id).where(stack_id: stack.id).exists?
  end

  def my?(stack)
    MyStack.where(user_id: self.id).where(stack_id: stack.id).exists?
  end

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
