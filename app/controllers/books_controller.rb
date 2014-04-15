class BooksController < ApplicationController
  helper_method :add
  # GET /books
  # GET /books.json
  def add(num)
    #item = '9781133049791'
    item = num.fetch("isbn")
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
    @thisBook = Book.find(:all, :conditions => {:isbn => item})
    redirect_to @thisBook
  end

  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = params[:book]
    add(@book)
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
end
