class EmployeesController < ApplicationController
    def create
        Employee.create(employee_params)
        redirect_to employees_path
    end

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

     def edit 
        @dogs = Dog.all
    end

    def employee_params(*args)
        params.require(:employee).permit(*args)
    end

end
