require "rails_helper"

RSpec.describe Events::IndexPageRepository do
  context "Get data for dashboadr page" do
    describe ".paginate" do
      it "return 5 events" do
        events = described_class.new(Event).paginate(1)

        expect(events.count).to be(5)
      end
    end
  end
end
