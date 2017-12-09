<<<<<<< HEAD
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
=======
class Enter::CompaniesController < Enter::ApplicationController
  before_action :set_company, only: [:index, :show, :edit, :update, :destroy]

  def index
    # @services = Service.all
    @user = current_user
    # @company = Company.find_by(id: @user.company_id)
    # @services = Service.where(company_id: @company.id)
    # redirect_to enter_company_path(@company)
  end

  def show
    @user = current_user
    puts @user.email
    @services = Service.where(company_id: @company.id)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to "/enter/companies/#{@company.id}", notice: 'Company was successfully updated.' }
        format.json { render :"/enter/companies/#{@company.id}", status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(current_user.company_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:name, :site_url, :logo_url, :describe, :company_field_id)
  end
end
>>>>>>> df5e3efab81fa3f7aa706cf9c13b8a2ed12eef10
