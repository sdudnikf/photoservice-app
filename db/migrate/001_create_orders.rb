class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.string :customer_phone
      t.string :service_type
      t.integer :status, default: 0
      t.text :notes

      t.timestamps
    end
  end
end
