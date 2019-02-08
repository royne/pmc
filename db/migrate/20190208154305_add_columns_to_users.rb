class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :state, :boolean, default: true, null: true
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
  end
end
