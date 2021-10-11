class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      #references creates foreign key for table it belongs to (Company)
      t.references :company, foregn_key: true
    end
  end
end
