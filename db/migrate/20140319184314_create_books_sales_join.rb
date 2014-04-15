class CreateBooksSalesJoin < ActiveRecord::Migration
  def up
  	create_table 'books_sales', :id => false do |t|
  		t.column 'sale_id', :integer
  		t.column 'book_id', :integer
  	end
  end

  def down
  	drop_table 'books_sales'
  end
end
