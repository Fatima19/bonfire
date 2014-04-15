class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :isbn
      t.string :name
      t.string :author
      t.integer :edition
      t.integer :retail_price
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
