class DogsController < ApplicationController

  before_action :define_current_dog

  def define_current_dog
    if params[:id]
      @dog = Dog.find(params[:id])
    else
      @dog = Dog.new
    end
  end

  def index
    @dogs = Dog.all
  end

  def show # already has @dog
  end

end
