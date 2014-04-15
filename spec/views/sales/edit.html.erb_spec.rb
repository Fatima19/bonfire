require 'spec_helper'

describe "sales/edit" do
  before(:each) do
    @sale = assign(:sale, stub_model(Sale,
      :price => 1,
      :condition => "MyString",
      :photo => "MyString"
    ))
  end

  it "renders the edit sale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sales_path(@sale), :method => "post" do
      assert_select "input#sale_price", :name => "sale[price]"
      assert_select "input#sale_condition", :name => "sale[condition]"
      assert_select "input#sale_photo", :name => "sale[photo]"
    end
  end
end
