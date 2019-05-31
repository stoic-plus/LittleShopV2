class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.decimal :price
      t.boolean :fulfilled
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
