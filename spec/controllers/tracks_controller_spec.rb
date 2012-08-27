require 'spec_helper'

describe TracksController do

  def valid_attributes
    { :title => "Everlong", :artist => "Foo Fighters", :year => 1997 }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all tracks as @tracks" do
      track = Track.create! valid_attributes
      get :index, {}, valid_session
      assigns(:tracks).to_a.should eq([track])
    end
  end

  describe "GET show" do
    it "assigns the requested track as @track" do
      track = Track.create! valid_attributes
      get :show, {:id => track.to_param}, valid_session
      assigns(:track).should eq(track)
    end
  end

  describe "GET new" do
    it "assigns a new track as @track" do
      get :new, {}, valid_session
      assigns(:track).should be_a_new(Track)
    end
  end

  describe "GET edit" do
    it "assigns the requested track as @track" do
      track = Track.create! valid_attributes
      get :edit, {:id => track.to_param}, valid_session
      assigns(:track).should eq(track)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Track" do
        expect {
          post :create, {:track => valid_attributes}, valid_session
        }.to change(Track, :count).by(1)
      end

      it "assigns a newly created track as @track" do
        post :create, {:track => valid_attributes}, valid_session
        assigns(:track).should be_a(Track)
        assigns(:track).should be_persisted
      end

      it "redirects to the created track" do
        post :create, {:track => valid_attributes}, valid_session
        response.should redirect_to(Track.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved track as @track" do
        # Trigger the behavior that occurs when invalid params are submitted
        Track.any_instance.stub(:save).and_return(false)
        post :create, {:track => {}}, valid_session
        assigns(:track).should be_a_new(Track)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Track.any_instance.stub(:save).and_return(false)
        post :create, {:track => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested track" do
        track = Track.create! valid_attributes
        # Assuming there are no other tracks in the database, this
        # specifies that the Track created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Track.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => track.to_param, :track => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested track as @track" do
        track = Track.create! valid_attributes
        put :update, {:id => track.to_param, :track => valid_attributes}, valid_session
        assigns(:track).should eq(track)
      end

      it "redirects to the track" do
        track = Track.create! valid_attributes
        put :update, {:id => track.to_param, :track => valid_attributes}, valid_session
        response.should redirect_to(track)
      end
    end

    describe "with invalid params" do
      it "assigns the track as @track" do
        track = Track.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Track.any_instance.stub(:save).and_return(false)
        put :update, {:id => track.to_param, :track => {}}, valid_session
        assigns(:track).should eq(track)
      end

      it "re-renders the 'edit' template" do
        track = Track.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Track.any_instance.stub(:save).and_return(false)
        put :update, {:id => track.to_param, :track => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested track" do
      track = Track.create! valid_attributes
      expect {
        delete :destroy, {:id => track.to_param}, valid_session
      }.to change(Track, :count).by(-1)
    end

    it "redirects to the tracks list" do
      track = Track.create! valid_attributes
      delete :destroy, {:id => track.to_param}, valid_session
      response.should redirect_to(tracks_url)
    end
  end

end
