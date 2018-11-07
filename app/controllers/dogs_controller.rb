class DogsController < ApplicationController

    def create
        Dog.create(dog_params)
        redirect_to dogs_path
    end

    def index
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def dog_params(*args)
        params.require(:dog).permit(*args)
    end


end
