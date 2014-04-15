class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  helper_method :add
  # GET /books
  # GET /books.json
  def add(num)
    #item = '9781133049791'
    item = num.fetch("book_id")
    if !Book.pluck(:isbn).include?(item)
      @res  = Amazon::Ecs.item_search(item,  { :search_index => 'All', :response_group => 'Medium' })
      @res.items.each do |book|
        @db = Book.create
        @db.isbn = item
        @db.author = book.get('ItemAttributes/Author')
        @db.name = book.get('ItemAttributes/Title')
        @db.edition = book.get('ItemAttributes/Edition').to_i
        @db.retail_price = ((book.get('ItemAttributes/ListPrice/Amount').to_f/100)*3.65).to_i
        @db.description = book.get('EditorialReviews/EditorialReview/Content')
        @db.photo = book.get('LargeImage/URL')
        @db.save
      end
    end
    thisBook = Book.find(:all, :conditions => {:isbn => item})[0]
    identification = thisBook.id
    price = num.fetch("price")
    condition = num.fetch("condition")
    charity = num.fetch("charity")

    sale = Hash.new
    sale["book_id"] = identification
    sale["price"] = price
    sale["condition"] = condition
    sale["charity"] = charity

    return sale

  end
end