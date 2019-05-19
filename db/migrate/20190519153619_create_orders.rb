class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :id
      t.datetime :user_id
      t.integer :status
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
