class AddContactToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address1, :string
    add_column :users, :pobox, :string
    add_column :users, :phone, :integer
  end
end
