class Enter::CompaniesController < Enter::ApplicationController
  def index
    # @services = Service.all
    @user = current_user
    @company = Company.find_by(id: @user.company_id)
    @services = Service.where(company_id: @company.id)
  end

  def edit_company
  end

  def update_company
  end

  def show_service
  end

  def update_service
  end

  def edit_service
  end

  def new_service
  end

  def create_service
  end

  def delete_service
  end

  def add_stack
  end

  def delete_stack
  end
end
