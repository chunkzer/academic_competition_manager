require "rails_helper"

RSpec.describe EventRequirementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_requirements").to route_to("event_requirements#index")
    end

    it "routes to #new" do
      expect(:get => "/event_requirements/new").to route_to("event_requirements#new")
    end

    it "routes to #show" do
      expect(:get => "/event_requirements/1").to route_to("event_requirements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_requirements/1/edit").to route_to("event_requirements#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_requirements").to route_to("event_requirements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_requirements/1").to route_to("event_requirements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_requirements/1").to route_to("event_requirements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_requirements/1").to route_to("event_requirements#destroy", :id => "1")
    end

  end
end
