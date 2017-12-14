class MainController < ApplicationController
  def index
    @gitdata = Gittrend.all.limit(5)
  end

  def search
    @check = params[:search]
    @result_stacks = Stack.where("name Like ?", "%#{params[:search].capitalize}%")
    @result_companies = Company.where("name Like ?", "%#{params[:search]}%")
    @result_services = Service.where("name Like ?", "%#{params[:search]}%")
  end
end
