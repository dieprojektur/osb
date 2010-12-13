require 'spec_helper'

describe "open_spaces/new.html.erb" do
  before(:each) do
    assign(:open_space, stub_model(OpenSpace,
      :name => "MyString",
      :location => "MyString"
    ).as_new_record)
  end

  it "renders new open_space form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => open_spaces_path, :method => "post" do
      assert_select "input#open_space_name", :name => "open_space[name]"
      assert_select "input#open_space_location", :name => "open_space[location]"
    end
  end
end
