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
    @employee = Employee.create(employee_params)
    if @employee.errors.any?
      render :new
    else
      redirect_to @employee
    end
  end

  def show
  end

  def edit
    @dogs = Dog.all
  end

  def update
    @employee.update(employee_params)
    if @employee.errors.any?
      render :show
    else
      redirect_to @employee
    end
  end

end
