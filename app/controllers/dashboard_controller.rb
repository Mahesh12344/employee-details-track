class DashboardController < ApplicationController

	def employee_listings
		if params[:advanced_search].present?
			employees = Employee.where("employee_name LIKE ?", "%#{params[:employee_name]}%")
		else
			employees = Employee.all
		end
		@employees = employees.paginate(:page => params[:page], :per_page => 10)
	end
	
end
