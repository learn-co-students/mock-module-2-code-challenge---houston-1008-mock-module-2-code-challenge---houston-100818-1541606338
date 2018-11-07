class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    # redirect_to @dog
  end

  def show
    @dog = Dog.find(params[:id])
  end

end
