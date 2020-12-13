class DashboardController < ApplicationController

	def employee_listings
		if params[:advanced_search].present?
			employees = Employee.where("employee_name LIKE ?", "%#{params[:employee_name]}%")
			total_count = employees.size
		else
			employees = Employee.all
			total_count = employees.size
		end
		@total_count = total_count
		@employees = employees.paginate(:page => params[:page], :per_page => 5)
	end

end
