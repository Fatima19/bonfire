require 'spec_helper'

describe "sales/index" do
  before(:each) do
    assign(:sales, [
      stub_model(Sale,
        :price => 1,
        :condition => "Condition",
        :photo => "Photo"
      ),
      stub_model(Sale,
        :price => 1,
        :condition => "Condition",
        :photo => "Photo"
      )
    ])
  end

  it "renders a list of sales" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end
