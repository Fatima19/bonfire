class ChangeDescriptionInBooks < ActiveRecord::Migration
  def up
  	change_column :books, :description, :text, :limit => nil
  end

  def down
  end
end
