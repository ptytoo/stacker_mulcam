class Indi::UsersController < Indi::ApplicationController
  def index
    @user = current_user
    @stacks = InterStack.where(user_id: @user.id)
    @mstacks = MyStack.where(user_id: @user.id)
  end

  def regist_stack
    stack_list = params[:ret]
    puts stack_list
  end
end
