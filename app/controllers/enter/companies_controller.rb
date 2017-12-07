class Enter::CompaniesController < Enter::ApplicationController
  def index
    # @services = Service.all
    @user = current_user
  end

end
