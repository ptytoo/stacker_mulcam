class Enter::CompaniesController < Enter::ApplicationController
  def index
    # @services = Service.all
    @user = current_user
    @company = Company.find_by(id: @user.company_id)
  end
  
end
