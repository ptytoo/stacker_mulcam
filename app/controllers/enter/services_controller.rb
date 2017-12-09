class Enter::ServicesController < Enter::ApplicationController
  def index
    # @services = Service.all
    @user = current_user
    @company = Company.find_by(id: @user.company_id)
    @services = Service.where(company_id: @company.id)
  end

  def show

  end

  def update
  end

  def edit

  end

  def new
    @servcie = Service.all
  end

  def create
  end

  def delete
  end

  def add_stack
  end

  def delete_stack
  end
end
