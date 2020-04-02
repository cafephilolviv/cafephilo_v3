# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Events::IndexPageRepository do
  context 'Get data for dashboadr page' do
    describe '.paginate' do
      it 'return 5 events' do
        10.times do |n|
          Event.create(title: "First event #{n}",
                       description: "Test #{n}",
                       date: '11.01.2011',
                       publish: true)
        end
        events = described_class.new(Event).paginate(1)

        expect(events.count).to be(5)
      end

      it 'return 0 when upublished events' do
        10.times do |n|
          Event.create(title: "First event #{n}",
                       description: "Test #{n}",
                       date: '11.01.2011')
        end
        events = described_class.new(Event).paginate(1)

        expect(events.count).to be(0)
      end
    end
  end
end
