require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = Event.new(name: "Hackers and Founders Meetup")
  end

  subject { @event}

  describe "when name is not present" do
    before { @event.name = " " }
    it { should_not be_valid }
  end
end
