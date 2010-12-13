require 'spec_helper'

describe "open_spaces/show.html.erb" do
  before(:each) do
    @open_space = assign(:open_space, stub_model(OpenSpace,
      :name => "Name",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
  end
end
