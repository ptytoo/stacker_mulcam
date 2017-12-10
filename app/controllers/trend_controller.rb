class TrendController < ApplicationController
  def index
    @stack_trends = StackTrend.all.to_a
    @types = ['Programming Languages','Client Libraries','HTTP Server Technologies',
      'Server Libraries','Databases and NoSQL Data','Server Software','Oprerationg Systems',
      'Cloud/Hardware Infrastructure','3rd Party APIs/Services']
  end

  def show
  end
end
