require 'rails_helper'

RSpec.describe "EventRequirements", type: :request do
  describe "GET /event_requirements" do
    it "works! (now write some real specs)" do
      get event_requirements_path
      expect(response).to have_http_status(200)
    end
  end
end
