class ChangeBooksFieldTypes < ActiveRecord::Migration
  def up
  	change_column :books, :name, :text, :limit => nil
  	change_column :books, :author, :text, :limit => nil
  	change_column :books, :photo, :text, :limit => nil
  end

  def down
  end
end
