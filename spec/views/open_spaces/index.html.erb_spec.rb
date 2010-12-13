require 'spec_helper'

describe "open_spaces/index.html.erb" do
  before(:each) do
    assign(:open_spaces, [
      stub_model(OpenSpace,
        :name => "Name",
        :location => "Location"
      ),
      stub_model(OpenSpace,
        :name => "Name",
        :location => "Location"
      )
    ])
  end

  it "renders a list of open_spaces" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
