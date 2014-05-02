class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
      t.string :name
      t.string :image_path

      t.timestamps
    end
  end
end
