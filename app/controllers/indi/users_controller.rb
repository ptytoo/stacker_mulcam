class Indi::UsersController < Indi::ApplicationController
  def index
    @user = current_user
    @stacks = InterStack.where(user_id: @user.id)
    @mstacks = MyStack.where(user_id: @user.id)
  end

  def regist_stack
    stack_list = params[:return_val]
    stack_list.each do |st|
        MyStack.create(
          user_id: current_user.id,
          stack_id: st
        )
    end
  end
end
