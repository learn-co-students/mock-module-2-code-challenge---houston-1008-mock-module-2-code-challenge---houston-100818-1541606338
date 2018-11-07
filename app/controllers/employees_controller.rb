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
        if params[:id]
            redirect_to employee_path(@employee)
        else 
            flash[:notice] = "Couldn't create Employee"
            redirect_to new_employee_path
           
        end 
    end

    def update 
        returning = @employee.update(employee_params)
        if returning == nil 
            flash[:notice] = "Couldn't edit Employee"
            redirect_to edit_employee_path
        else 
        redirect_to employee_path(@employee)
        end
    end 
   
end
