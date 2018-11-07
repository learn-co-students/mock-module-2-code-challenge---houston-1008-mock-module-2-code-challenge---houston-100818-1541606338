class EmployeesController < ApplicationController
    
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end
    
    def new
        @employee = Employee.new
        @dogs = Dog.all
        @img = 'https://uniforlocal1285.ca/wp-content/uploads/2018/04/placeholder.png'
    end
    
    def create
        @employee = Employee.create(employee_params)
        redirect_to employee_path(@employee)
    end
    
    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
        @img = @employee.img_url
    end
    
    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end

    private

    def employee_params
        params[:employee].permit(:first_name, :last_name, :title, :office, :alias, :img_url, :dog_id)
    end
end
