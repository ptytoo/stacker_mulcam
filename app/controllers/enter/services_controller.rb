class Enter::ServicesController < Enter::ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy, :regist_stack]

  # GET /services
  # GET /services.json
  def index
    @company = Company.find_by(params[:id])
    @services = Service.where(company_id: params[:id])
  end

  # GET /services/1
  # GET /services/1.json
  def show
    # @services = Service.all
    # @service = Service.find_by(company_id: params[:id])
    @stacks = ServiceStack.where(service_id: @service.id)
  end

  # GET /services/new
  def new
    @service = Service.new
    @stacks = Stack.all
    @company = Company.find_by(params[:id])
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to "/enter/companies/#{@service.company_id}/services/#{@service.id}", notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to "/enter/companies/#{@service.company_id}/services/#{@service.id}", notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_stack
    stack_list = params[:return_val]
    stack_list.each do |st|
        check = ServiceStack.where(service_id: @service.id).where(stack_id: st).exists?
        unless check
          ServiceStack.create(
            service_id: @service.id,
            stack_id: st
          )
        end
    end
  end
  def delete_stack
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :site_url, :logo_url, :describe, :company_id)
    end
end
