class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :account_no, :string
    add_column :users, :role, :string
  end
end
