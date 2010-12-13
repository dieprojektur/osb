require 'spec_helper'

describe "open_spaces/edit.html.erb" do
  before(:each) do
    @open_space = assign(:open_space, stub_model(OpenSpace,
      :name => "MyString",
      :location => "MyString"
    ))
  end

  it "renders the edit open_space form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => open_space_path(@open_space), :method => "post" do
      assert_select "input#open_space_name", :name => "open_space[name]"
      assert_select "input#open_space_location", :name => "open_space[location]"
    end
  end
end
