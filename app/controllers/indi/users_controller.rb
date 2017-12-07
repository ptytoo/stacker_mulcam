class Indi::UsersController < Indi::ApplicationController
  def index
    @user = current_user
  end

end
