class EmployeesController < ApplicationController
  before_action :my_emp 

  def index 
  end 

  def show 
  end 

  def create 

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
