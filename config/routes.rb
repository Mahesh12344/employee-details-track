Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#employee_listings'

	resources :employees do 
    collection do
      get 'download_data'
    end
  end

  get 'employees_list', to: 'dashboard#employee_listings'

end
