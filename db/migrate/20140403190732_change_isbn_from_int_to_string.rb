class ChangeIsbnFromIntToString < ActiveRecord::Migration
  def up
  	change_column :books, :isbn, :string
  end

  def down
  end
end
