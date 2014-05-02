class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :address
      t.string :identification_number
      t.string :email
      t.boolean :listed_on_exchange
      t.string :type

      t.timestamps
    end
  end
end
