class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
    @stacks = Stack.all
    @companies = Company.all
  end

end
