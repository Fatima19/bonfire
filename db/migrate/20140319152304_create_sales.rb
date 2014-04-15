class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :book_id
      t.integer :price
      t.string :condition
      t.string :photo

      t.timestamps
    end
  end
end
