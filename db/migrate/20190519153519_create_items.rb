class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :id
      t.integer :user_id
      t.string :name
      t.boolean :active
      t.decimal :price
      t.text :description
      t.string :image
      t.integer :inventory
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
