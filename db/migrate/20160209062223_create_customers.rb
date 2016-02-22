class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :event_date
      t.string :gallery_web_address
      t.string :event_location
      t.string :note
      t.datetime :event_date

      t.timestamps null: false
    end

    add_index :customers, :email, unique: true
  end
end
