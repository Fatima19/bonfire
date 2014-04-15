require 'spec_helper'

describe "books/index" do
  before(:each) do
    assign(:books, [
      stub_model(Book,
        :isbn => 1,
        :name => "Name",
        :author => "Author",
        :edition => 2,
        :retail_price => 3,
        :description => "Description",
        :photo => "Photo"
      ),
      stub_model(Book,
        :isbn => 1,
        :name => "Name",
        :author => "Author",
        :edition => 2,
        :retail_price => 3,
        :description => "Description",
        :photo => "Photo"
      )
    ])
  end

  it "renders a list of books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end
