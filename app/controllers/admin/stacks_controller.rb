class Admin::StacksController < Admin::ApplicationController
  def index
    @stacks = Stack.all
  end


end
