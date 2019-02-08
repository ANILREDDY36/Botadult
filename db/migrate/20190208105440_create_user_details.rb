class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.integer :user_id	
      t.string :user_name
      t.datetime :birthday
      t.string :contact_number
      t.string :city
      t.string :state
      t.string :country
      t.datetime :medical_status_date_checked
      t.integer :medical_status_result
      # t.string :medical_status
      t.string :proof_type
      # t.string :proof_type_front
      # t.string :proof_type_back
      t.timestamps
    end
  end
end
