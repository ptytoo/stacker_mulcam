class Indi::UsersController < Indi::ApplicationController
  def index
    @user = current_user
    @stacks = InterStack.where(user_id: @user.id)
    @mstacks = MyStack.where(user_id: @user.id)
  end

end
