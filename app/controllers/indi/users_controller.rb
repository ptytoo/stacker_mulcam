class Indi::UsersController < Indi::ApplicationController
  def index
    @user = current_user
    @my_stack = InterStack.where(user_id: @user.id)
    @stack = []
  end

end
