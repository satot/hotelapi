class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.text   :url, null: false

      t.timestamps
    end
  end
end
