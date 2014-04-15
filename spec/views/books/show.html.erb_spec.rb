require 'spec_helper'

describe "books/show" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :isbn => 1,
      :name => "Name",
      :author => "Author",
      :edition => 2,
      :retail_price => 3,
      :description => "Description",
      :photo => "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Author/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Description/)
    rendered.should match(/Photo/)
  end
end
