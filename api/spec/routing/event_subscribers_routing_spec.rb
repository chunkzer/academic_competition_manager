require "rails_helper"

RSpec.describe EventSubscribersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_subscribers").to route_to("event_subscribers#index")
    end

    it "routes to #new" do
      expect(:get => "/event_subscribers/new").to route_to("event_subscribers#new")
    end

    it "routes to #show" do
      expect(:get => "/event_subscribers/1").to route_to("event_subscribers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_subscribers/1/edit").to route_to("event_subscribers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_subscribers").to route_to("event_subscribers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_subscribers/1").to route_to("event_subscribers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_subscribers/1").to route_to("event_subscribers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_subscribers/1").to route_to("event_subscribers#destroy", :id => "1")
    end

  end
end
