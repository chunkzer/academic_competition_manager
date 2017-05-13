require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe EventSubscriptionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # EventSubscription. As you add validations to EventSubscription, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventSubscriptionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all event_subscribers as @event_subscribers" do
      event_subscriber = EventSubscription.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:event_subscriptions)).to eq([event_subscriber])
    end
  end

  describe "GET #show" do
    it "assigns the requested event_subscriber as @event_subscriber" do
      event_subscriber = EventSubscription.create! valid_attributes
      get :show, params: {id: event_subscriber.to_param}, session: valid_session
      expect(assigns(:event_subscriber)).to eq(event_subscriber)
    end
  end

  describe "GET #new" do
    it "assigns a new event_subscriber as @event_subscriber" do
      get :new, params: {}, session: valid_session
      expect(assigns(:event_subscriber)).to be_a_new(EventSubscription)
    end
  end

  describe "GET #edit" do
    it "assigns the requested event_subscriber as @event_subscriber" do
      event_subscriber = EventSubscription.create! valid_attributes
      get :edit, params: {id: event_subscriber.to_param}, session: valid_session
      expect(assigns(:event_subscriber)).to eq(event_subscriber)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new EventSubscription" do
        expect {
          post :create, params: {event_subscriber: valid_attributes}, session: valid_session
        }.to change(EventSubscription, :count).by(1)
      end

      it "assigns a newly created event_subscriber as @event_subscriber" do
        post :create, params: {event_subscriber: valid_attributes}, session: valid_session
        expect(assigns(:event_subscriber)).to be_a(EventSubscription)
        expect(assigns(:event_subscriber)).to be_persisted
      end

      it "redirects to the created event_subscriber" do
        post :create, params: {event_subscriber: valid_attributes}, session: valid_session
        expect(response).to redirect_to(EventSubscription.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved event_subscriber as @event_subscriber" do
        post :create, params: {event_subscriber: invalid_attributes}, session: valid_session
        expect(assigns(:event_subscriber)).to be_a_new(EventSubscription)
      end

      it "re-renders the 'new' template" do
        post :create, params: {event_subscriber: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested event_subscriber" do
        event_subscriber = EventSubscription.create! valid_attributes
        put :update, params: {id: event_subscriber.to_param, event_subscriber: new_attributes}, session: valid_session
        event_subscriber.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested event_subscriber as @event_subscriber" do
        event_subscriber = EventSubscription.create! valid_attributes
        put :update, params: {id: event_subscriber.to_param, event_subscriber: valid_attributes}, session: valid_session
        expect(assigns(:event_subscriber)).to eq(event_subscriber)
      end

      it "redirects to the event_subscriber" do
        event_subscriber = EventSubscription.create! valid_attributes
        put :update, params: {id: event_subscriber.to_param, event_subscriber: valid_attributes}, session: valid_session
        expect(response).to redirect_to(event_subscriber)
      end
    end

    context "with invalid params" do
      it "assigns the event_subscriber as @event_subscriber" do
        event_subscriber = EventSubscription.create! valid_attributes
        put :update, params: {id: event_subscriber.to_param, event_subscriber: invalid_attributes}, session: valid_session
        expect(assigns(:event_subscriber)).to eq(event_subscriber)
      end

      it "re-renders the 'edit' template" do
        event_subscriber = EventSubscription.create! valid_attributes
        put :update, params: {id: event_subscriber.to_param, event_subscriber: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event_subscriber" do
      event_subscriber = EventSubscription.create! valid_attributes
      expect {
        delete :destroy, params: {id: event_subscriber.to_param}, session: valid_session
      }.to change(EventSubscription, :count).by(-1)
    end

    it "redirects to the event_subscribers list" do
      event_subscriber = EventSubscription.create! valid_attributes
      delete :destroy, params: {id: event_subscriber.to_param}, session: valid_session
      expect(response).to redirect_to(event_subscribers_url)
    end
  end

end