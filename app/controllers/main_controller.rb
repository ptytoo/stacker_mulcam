class MainController < ApplicationController
  def index
    @gitdata = Gittrend.all
  end

  def search
    @check = params[:search]
    @result = Stack.where("name Like ?", "%#{params[:search].capitalize}%")
  end
end
