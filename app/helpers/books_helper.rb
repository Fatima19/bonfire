module BooksHelper
	def current_book
      @current_book ||= current_sale.books.all
  	end

  def current_book(sale)
      @current_book ||= sale.books.all
    end
end
