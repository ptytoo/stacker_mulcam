class Indi::UsersController < Indi::ApplicationController
  def index
    @user = current_user
    @stacks = InterStack.where(user_id: @user.id)
    @mstacks = MyStack.where(user_id: @user.id)
  end

  def add_stack
    # @stacks = Stack.all
    # @stack = Stack.all.to_a
    @stack_fields = StackField.all
  end

  def regist_stack
    stack_list = params[:return_val]
    puts "Stack List is..."
    puts stack_list
    stack_list.each do |st|
        check = MyStack.where(user_id: current_user).where(stack_id: st).exists?
        unless check
          MyStack.create(
            user_id: current_user.id,
            stack_id: st
          )
        end
    end
    redirect_to indi_users_path
  end
end
