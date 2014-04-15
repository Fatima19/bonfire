require 'spec_helper'

describe "sales/show" do
  before(:each) do
    @sale = assign(:sale, stub_model(Sale,
      :price => 1,
      :condition => "Condition",
      :photo => "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Condition/)
    rendered.should match(/Photo/)
  end
end
