class EmployeesController < ApplicationController
	
	def new
		@employee = Employee.new
	end

	
	def create
		@employee = Employee.new(employee_params)
		if @employee.save
		 flash[:notice] = "Employee Added Successfully!"
		 redirect_to root_path
		else
		 flash[:alert] = "Error while Adding Employee.."
		 render :new
		end
	end

	def download_data
		# byebug
    if params[:advanced_search].present?
      employees = Employee.where("employee_name LIKE ?", "%#{params[:employee_name]}%")
    else
      employees = Employee.all
    end
    # byebug
    csv_string = CSV.generate() do |csv|
      csv << ["#ID","Employee ID","Employee Name","Email Address","Phone",
              "Date of Birth","Created At","Updated At"]

      employees.each do |record|
        csv << [record.id,record.employee_id,record.employee_name,record.email_address,
                record.phone,record.date_of_birth,record.created_at,record.updated_at]
      end
    end
    send_data csv_string, :type => 'text/csv; charset=utf-8; header=present', :disposition => "attachment; filename=employees-#{Date.today}.csv"
  end

	private

	
	def employee_params
		params.require(:employee).permit(:employee_id, :employee_name, :email_address, :phone, :date_of_birth, :image)
	end
end
