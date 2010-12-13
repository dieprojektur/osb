require 'spec_helper'

describe OpenSpacesController do

  def mock_open_space(stubs={})
    (@mock_open_space ||= mock_model(OpenSpace).as_null_object).tap do |open_space|
      open_space.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all open_spaces as @open_spaces" do
      OpenSpace.stub(:all) { [mock_open_space] }
      get :index
      assigns(:open_spaces).should eq([mock_open_space])
    end
  end

  describe "GET show" do
    it "assigns the requested open_space as @open_space" do
      OpenSpace.stub(:get).with("37") { mock_open_space }
      get :show, :id => "37"
      assigns(:open_space).should be(mock_open_space)
    end
  end

  describe "GET new" do
    it "assigns a new open_space as @open_space" do
      OpenSpace.stub(:new) { mock_open_space }
      get :new
      assigns(:open_space).should be(mock_open_space)
    end
  end

  describe "GET edit" do
    it "assigns the requested open_space as @open_space" do
      OpenSpace.stub(:get).with("37") { mock_open_space }
      get :edit, :id => "37"
      assigns(:open_space).should be(mock_open_space)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created open_space as @open_space" do
        OpenSpace.stub(:new).with({'these' => 'params'}) { mock_open_space(:save => true) }
        post :create, :open_space => {'these' => 'params'}
        assigns(:open_space).should be(mock_open_space)
      end

      it "redirects to the created open_space" do
        OpenSpace.stub(:new) { mock_open_space(:save => true) }
        post :create, :open_space => {}
        response.should redirect_to(open_space_url(mock_open_space))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved open_space as @open_space" do
        OpenSpace.stub(:new).with({'these' => 'params'}) { mock_open_space(:save => false) }
        post :create, :open_space => {'these' => 'params'}
        assigns(:open_space).should be(mock_open_space)
      end

      it "re-renders the 'new' template" do
        OpenSpace.stub(:new) { mock_open_space(:save => false) }
        post :create, :open_space => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested open_space" do
        OpenSpace.should_receive(:get).with("37") { mock_open_space }
        mock_open_space.should_receive(:update).with({'these' => 'params'})
        put :update, :id => "37", :open_space => {'these' => 'params'}
      end

      it "assigns the requested open_space as @open_space" do
        OpenSpace.stub(:get) { mock_open_space(:update => true) }
        put :update, :id => "1"
        assigns(:open_space).should be(mock_open_space)
      end

      it "redirects to the open_space" do
        OpenSpace.stub(:get) { mock_open_space(:update => true) }
        put :update, :id => "1"
        response.should redirect_to(open_space_url(mock_open_space))
      end
    end

    describe "with invalid params" do
      it "assigns the open_space as @open_space" do
        OpenSpace.stub(:get) { mock_open_space(:update => false) }
        put :update, :id => "1"
        assigns(:open_space).should be(mock_open_space)
      end

      it "re-renders the 'edit' template" do
        OpenSpace.stub(:get) { mock_open_space(:update => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested open_space" do
      OpenSpace.should_receive(:get).with("37") { mock_open_space }
      mock_open_space.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the open_spaces list" do
      OpenSpace.stub(:get) { mock_open_space }
      delete :destroy, :id => "1"
      response.should redirect_to(open_spaces_url)
    end
  end

end
