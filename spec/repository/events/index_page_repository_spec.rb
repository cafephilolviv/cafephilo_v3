# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Events::IndexPageRepository do
  describe '.paginate' do
    let(:events) { described_class.new(Event).paginate(1) }
    context 'Get data for dashboard page and returns 5 events' do
      it do
        10.times do |n|
          Event.create(title: "First event #{n}",
                       description: "Test #{n}",
                       date: '11.01.2011',
                       publish: true)
        end

        expect(events.count).to be(5)
      end
    end

    context 'Get data for dashboard page and returns 0 events' do
      it do
        10.times do |n|
          Event.create(title: "First event #{n}",
                       description: "Test #{n}",
                       date: '11.01.2011')
        end

        expect(events.count).to be(0)
      end
    end
  end
end
