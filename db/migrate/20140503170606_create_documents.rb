class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :company, null: false

      t.timestamps
    end
  end
end
