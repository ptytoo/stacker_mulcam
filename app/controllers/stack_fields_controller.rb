class StackFieldsController < ApplicationController
  before_action :set_stack_field, only: [:show, :edit, :update, :destroy]

  # GET /stack_fields
  # GET /stack_fields.json
  def index
    @stack_fields = StackField.all
  end

  # GET /stack_fields/1
  # GET /stack_fields/1.json
  def show
  end

  # GET /stack_fields/new
  def new
    @stack_field = StackField.new
  end

  # GET /stack_fields/1/edit
  def edit
    authorize! :edit, @stack_field.id
  end

  # POST /stack_fields
  # POST /stack_fields.json
  def create
    @stack_field = StackField.new(stack_field_params)

    respond_to do |format|
      if @stack_field.save
        format.html { redirect_to @stack_field, notice: 'Stack field was successfully created.' }
        format.json { render :show, status: :created, location: @stack_field }
      else
        format.html { render :new }
        format.json { render json: @stack_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stack_fields/1
  # PATCH/PUT /stack_fields/1.json
  def update
    respond_to do |format|
      if @stack_field.update(stack_field_params)
        format.html { redirect_to @stack_field, notice: 'Stack field was successfully updated.' }
        format.json { render :show, status: :ok, location: @stack_field }
      else
        format.html { render :edit }
        format.json { render json: @stack_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stack_fields/1
  # DELETE /stack_fields/1.json
  def destroy
    @stack_field.destroy
    respond_to do |format|
      format.html { redirect_to stack_fields_url, notice: 'Stack field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack_field
      @stack_field = StackField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stack_field_params
      params.require(:stack_field).permit(:name)
    end
end
