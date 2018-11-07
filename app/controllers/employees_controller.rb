class EmployeesController < ApplicationController
  before_action :my_emp 

  def index 
  end 

  def show 
  end 

  def new 
    @emp = Employee.new
    @dogs = Dog.all
  end

  def create 
    @emp = Employee.new 

  end

  def edit 
  end

  def my_emp 
    if params[:id]
      @emp = Employee.find(params[:id])
    else 
      @emps = Employee.all
    end
  end
end
