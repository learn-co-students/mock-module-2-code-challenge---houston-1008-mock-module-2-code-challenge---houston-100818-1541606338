class DogsController < ApplicationController
  before_action :my_dog

  def index 
  end 
  
  def show
  end 

  def my_dog 
    if params[:id]
      @dog = Dog.find(params[:id])
    else 
      @dogs = Dog.all
    end
  end

end
