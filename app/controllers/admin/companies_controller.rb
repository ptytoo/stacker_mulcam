class Admin::CompaniesController < Admin::ApplicationController
  def index
    @companies = Company.all
  end

end
