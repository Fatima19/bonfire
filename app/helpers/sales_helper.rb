module SalesHelper
	def admin?
    current_user.admin?
  end

  	def current_sale
    	@current_sale ||= current_user.sales.all
  	end

    def current_sale(user)
      @current_sale ||= user.sales.all
    end

    def current_book
      @current_book ||= current_sale.books.all
  	end

  def current_book(sale)
      @current_book ||= sale.books.all
  end

  def current_user
      @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user_id
      return User.find_by_remember_token(cookies[:remember_token]).id
  end
end
