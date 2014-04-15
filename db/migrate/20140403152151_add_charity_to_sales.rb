class AddCharityToSales < ActiveRecord::Migration
  def change
  	add_column :sales, :charity, :string
  end
end
