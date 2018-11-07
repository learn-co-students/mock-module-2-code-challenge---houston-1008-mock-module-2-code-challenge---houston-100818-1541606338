class EmployeesController < ApplicationController
    before_action :current_employee

    def current_employee
        if params[:id]
            @employee = Employee.find(params[:id])
        else 
            @employee = Employee.new
        end
    end

    def index
        @employees = Employee.all
    end 

    def employee_params
        params.require(:employee).permit(:dog_id,
            :first_name, 
            :last_name, 
            :alias, 
            :title, 
            :office, 
            :img_URL)
    end 

    def create 
        @employee = Employee.create(employee_params)
        
        redirect_to employee_path(@employee)
    end

    def update 
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end 
   
end
