class EmployeesController < ApplicationController

    def update
        @employee = Employee.find(params[:id])
        @employee.update!(employee_params)
        redirect_to @employee
    end

    def index
        @employee = Employee.all
    end

    def edit
        @employee = Employee.find(params[:id])
    end


    def show
        @employee = Employee.find(params[:id])
    end


    def create
        Employee.create(employee_params)
        redirect_to employees_path
    end

    def employee_params
        employee = params.require(:employee)
        employee = params[:employee]
        employee.permit(:first_name,:last_name,:alias,:title,:office,:img_url,:dog_id)
    end
end
