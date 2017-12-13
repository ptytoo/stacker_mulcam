class CompanyFieldsController < ApplicationController
  before_action :set_company_field, only: [:show, :edit, :update, :destroy]
  # before_action :role_restrict, only:[:update, :edit, :destroy]
  # def role_restrict
  #   if user_signed_in?
  #     if !current_user.admin?
  #       # redirect_to :root
  #       raise ActionController::RoutingError.new('Not Found')
  #     end
  #   end
  # end

  # GET /company_fields
  # GET /company_fields.json
  def index
    @companys = Company.all
    @company_fields = CompanyField.all
  end

  # GET /company_fields/1
  # GET /company_fields/1.json
  def show
    @companies = Company.where(company_field_id: params[:id])
  end


  # GET /company_fields/new
  def new
    @company_field = CompanyField.new
  end

  # GET /company_fields/1/edit
  def edit
    authorize! :edit, @company_field.id
  end

  # POST /company_fields
  # POST /company_fields.json
  def create
    @company_field = CompanyField.new(company_field_params)

    respond_to do |format|
      if @company_field.save
        format.html { redirect_to @company_field, notice: 'Company field was successfully created.' }
        format.json { render :show, status: :created, location: @company_field }
      else
        format.html { render :new }
        format.json { render json: @company_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_fields/1
  # PATCH/PUT /company_fields/1.json
  def update
    respond_to do |format|
      if @company_field.update(company_field_params)
        format.html { redirect_to @company_field, notice: 'Company field was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_field }
      else
        format.html { render :edit }
        format.json { render json: @company_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_fields/1
  # DELETE /company_fields/1.json
  def destroy
    @company_field.destroy
    respond_to do |format|
      format.html { redirect_to company_fields_url, notice: 'Company field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_field
      @company_field = CompanyField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_field_params
      params.require(:company_field).permit(:name)
    end
end
