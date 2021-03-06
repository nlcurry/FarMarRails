class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales, id: false do |t|
      t.primary_key :id
      t.integer  :amount
      t.datetime :purchase_time
      t.integer  :vendor_id
      t.integer  :product_id

      t.timestamps null: false
    end
  end
end
