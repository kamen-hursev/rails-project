class CreateBrokersCompanies < ActiveRecord::Migration
  def change
    create_table :brokers_companies do |t|
      t.references :broker, null: false
      t.references :company, null: false
    end
  end
end
