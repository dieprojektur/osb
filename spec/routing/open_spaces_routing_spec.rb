require "spec_helper"

describe OpenSpacesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/open_spaces" }.should route_to(:controller => "open_spaces", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/open_spaces/new" }.should route_to(:controller => "open_spaces", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/open_spaces/1" }.should route_to(:controller => "open_spaces", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/open_spaces/1/edit" }.should route_to(:controller => "open_spaces", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/open_spaces" }.should route_to(:controller => "open_spaces", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/open_spaces/1" }.should route_to(:controller => "open_spaces", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/open_spaces/1" }.should route_to(:controller => "open_spaces", :action => "destroy", :id => "1")
    end

  end
end
