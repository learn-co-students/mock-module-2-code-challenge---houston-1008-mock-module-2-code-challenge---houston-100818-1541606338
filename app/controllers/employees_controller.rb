class EmployeesController < ApplicationController

  before_action :define_current_employee

  def define_current_employee
    if params[:id]
      @employee = Employee.find(params[:id])
    else
      @employee = Employee.new
    end
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

  def index
    @employees = Employee.all
  end

  def new
    @dogs = Dog.all
  end

  def create
    if Employee.uniq_alias_and_title?(params[:employee], @employee)
      @employee.first_name = employee_params[:first_name]
      @employee.last_name = employee_params[:last_name]
      @employee.alias = employee_params[:alias]
      @employee.title = employee_params[:title]
      @employee.office = employee_params[:office]
      @employee.img_url = employee_params[:img_url]
      @employee.dog_id = employee_params[:dog_id]
      @employee.save
      redirect_to @employee
    else
      redirect_to new_employee_path
    end
  end

  def show
  end

  def edit
    @dogs = Dog.all
  end

  def update
    if Employee.uniq_alias_and_title?(params[:employee], @employee)
      @employee.update(employee_params)
      redirect_to @employee
    else
      redirect_to edit_employee_path
    end
  end

end
