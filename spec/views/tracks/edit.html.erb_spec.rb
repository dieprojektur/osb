require 'spec_helper'

describe "tracks/edit.html.erb" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :name => "MyString",
      :location => "MyString",
      :position => 1
    ))
  end

  it "renders the edit track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => track_path(@track), :method => "post" do
      assert_select "input#track_name", :name => "track[name]"
      assert_select "input#track_location", :name => "track[location]"
      assert_select "input#track_position", :name => "track[position]"
    end
  end
end
