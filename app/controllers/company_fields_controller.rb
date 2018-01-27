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
    @companies = Company.all
    @company_fields = CompanyField.all
  end

  # GET /company_fields/1
  # GET /company_fields/1.json
  def show
    @companies = Company.where(company_field_id: params[:id])
    # @services_cnt = Service.select("services.name, COUNT(service_stacks.stack_id) stack_cnt")
    #             .joins("LEFT OUTER JOIN service_stacks ON services.id = service_stacks.service_id")
    #             .group("service_stacks.service_id")
    #             .order("stack_cnt DESC limit 10")
    # @analy = ServiceStack.select("stack_fields.name as field, ")
    #                     .where(company_field_id: params[:id])
    #                     .joins(:stack_fields)

    @stacks =
    ServiceStack.select('service_stacks.stack_id, COUNT(service_stacks.stack_id) cnt')
              .where(service_id: ((Company.where(company_field_id: params[:id])).select('services.id').joins(:services)))
              .group('service_stacks.stack_id')
              .order('cnt desc')
              .first(5)


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
