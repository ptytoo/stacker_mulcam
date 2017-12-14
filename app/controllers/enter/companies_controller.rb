class Enter::CompaniesController < Enter::ApplicationController
  before_action :set_company, only: [:index,:show, :edit, :update, :destroy]


  def index
    # @services = Service.all
    # @user = current_user
    # @company = Company.find_by(id: current_user.company_id)
    @services = Service.where(company_id: @company.id)
  end

  def show
    @services = Service.where(company_id: @company.id)
  end
  def new
    @company = Company.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to "/enter/companies/#{@company.id}", notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :site_url, :logo_url, :describe, :company_field_id)
    end

end
