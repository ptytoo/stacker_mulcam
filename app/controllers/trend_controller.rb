class TrendController < ApplicationController
  def index
    @stack_trends = StackTrend.all.to_a
    @types = ['Programming Languages','Client Libraries','HTTP Server Technologies',
      'Server Libraries','Databases and NoSQL Data','Server Software','Oprerationg Systems',
      'Cloud/Hardware Infrastructure','3rd Party APIs/Services']
    @octo_trends = OctoTrend.all.to_a
    @surveys = ['Ten most-forked projects','projects with the most contributors',
       'projects with the most reviews', 'ten most-discussed repositories', 'not just software']
  end

  def show
  end
end
