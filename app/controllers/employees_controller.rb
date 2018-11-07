class EmployeesController < ApplicationController

  def new
    @dog_ids = Dog.all.map{|dog| dog.id}
  end

  def create
    @dog_ids = Dog.all.map{|dog| dog.id}
    @employee = Employee.create(employee_params(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id))
    redirect_to @employee
  end

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @dog_ids = Dog.all.map{|dog| dog.id}
    @employee = Employee.find(params[:id])
  end

  def update
    @dog_ids = Dog.all.map{|dog| dog.id}
    @employee = Employee.find(params[:id])
    @employee.update(employee_params(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id))
    redirect_to @employee
  end

  def employee_params(*args)
    params.require(:employee).permit(*args)
  end

end
