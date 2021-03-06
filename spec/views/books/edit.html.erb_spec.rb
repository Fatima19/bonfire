require 'spec_helper'

describe "books/edit" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :isbn => 1,
      :name => "MyString",
      :author => "MyString",
      :edition => 1,
      :retail_price => 1,
      :description => "MyString",
      :photo => "MyString"
    ))
  end

  it "renders the edit book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path(@book), :method => "post" do
      assert_select "input#book_isbn", :name => "book[isbn]"
      assert_select "input#book_name", :name => "book[name]"
      assert_select "input#book_author", :name => "book[author]"
      assert_select "input#book_edition", :name => "book[edition]"
      assert_select "input#book_retail_price", :name => "book[retail_price]"
      assert_select "input#book_description", :name => "book[description]"
      assert_select "input#book_photo", :name => "book[photo]"
    end
  end
end
