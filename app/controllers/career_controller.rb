class CareerController < ApplicationController
  def index
    @stack = Stack.all.to_a
    @types = ['Front-end','Back-end','Database_Relational','Database_NoSQL','Server_Clouds','Server_App vs Web Server']
  end

  def show
  end
end
