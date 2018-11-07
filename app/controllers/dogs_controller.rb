class DogsController < ApplicationController
    before_action :current_dog
    
    def current_dog
        if params[:id]
            @dog = Dog.find(params[:id])
        else 
            @dog = Dog.new
        end
    end

    def index
        @dogs = Dog.all
    end 
end
