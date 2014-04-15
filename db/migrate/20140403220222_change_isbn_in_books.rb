class ChangeIsbnInBooks < ActiveRecord::Migration
  def up
  	change_column :books, :isbn, :text, :limit => nil
  end

  def down
  end
end
