class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.integer :employee_id
      t.string :employee_name
      t.string :email_address
      t.string :phone
      t.date :date_of_birth

      t.timestamps
    end
  end
end
