class StacksController < ApplicationController
  before_action :set_stack, only: [:show, :edit, :update, :destroy, :register_interesting, :register_my_stack]

  # GET /stacks
  # GET /stacks.json
  def index
    @stacks = Stack.all
    @stack_fields = StackField.all
    @stack_trends= StackTrend.all
    @field = StackTrend.select(:type_name).distinct

  end

  # GET /stacks/1
  # GET /stacks/1.json
  def show
  end

  # GET /stacks/new
  def new
    @stack = Stack.new
  end

  # GET /stacks/1/edit
  def edit
  end

  # POST /stacks
  # POST /stacks.json
  def create
    @stack = Stack.new(stack_params)

    respond_to do |format|
      if @stack.save
        format.html { redirect_to @stack, notice: 'Stack was successfully created.' }
        format.json { render :show, status: :created, location: @stack }
      else
        format.html { render :new }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stacks/1
  # PATCH/PUT /stacks/1.json
  def update
    respond_to do |format|
      if @stack.update(stack_params)
        format.html { redirect_to @stack, notice: 'Stack was successfully updated.' }
        format.json { render :show, status: :ok, location: @stack }
      else
        format.html { render :edit }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    @stack.destroy
    respond_to do |format|
      format.html { redirect_to stacks_url, notice: 'Stack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def register_interesting
    if user_signed_in?
      if InterStack.where(user_id: current_user.id, stack_id: @stack.id).first.nil?
        @result = InterStack.create(user_id: current_user.id, stack_id: @stack.id)
      else
        @result = InterStack.where(user_id: current_user.id, stack_id: @stack.id).first.destroy
      end
      @result = @result.frozen?
    end
  end

  def register_my_stack
    if user_signed_in?
      if MyStack.where(user_id: current_user.id, stack_id: @stack.id).first.nil?
        @result = MyStack.create(user_id: current_user.id, stack_id: @stack.id)
      else
        @result = MyStack.where(user_id: current_user.id, stack_id: @stack.id).first.destroy
      end
      @result = @result.frozen?
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack
      @stack = Stack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stack_params
      params.require(:stack).permit(:name, :site_url, :short_describe, :describe, :version, :stack_field_id)
    end
end
