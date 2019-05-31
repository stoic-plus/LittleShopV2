class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :role
      t.boolean :active
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
