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
    if Employee.create(emp_params).valid?
      @emp = Employee.create(emp_params)
      @emp.save
    else 
      puts "Invalid creation"
    end
    redirect_to employees_path
  end

  def edit 
    @dogs = Dog.all
  end

  def update 
    @emp.update(emp_params)
    redirect_to employee(@emp)
  end

  def my_emp 
    if params[:id]
      @emp = Employee.find(params[:id])
    else 
      @emps = Employee.all
    end
  end

  private 

  def emp_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url)
  end
end
