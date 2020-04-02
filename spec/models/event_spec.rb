# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  title         :string
#  date          :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  youtube_link  :string
#  mixcloud_link :string
#  publish       :boolean
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Event model should exist' do
    it { expect(Event.all).to be_truthy }
  end

  context 'Event has datetime' do
    event = Event.create(title: 'First event',
                         description: 'Test',
                         date: '11.01.2011')

    it { expect(event.date.day).to eq(11) }
    it { expect(event.date.month).to eq(0o1) }
    it { expect(event.date.year).to eq(2011) }
  end

  context 'Event has title' do
    event = Event.create(title: 'First event',
                         description: 'Test',
                         date: '11.01.2011')

    it { expect(event.title).to eq('First event') }
  end

  context 'Event has description' do
    event = Event.create(title: 'First event',
                         description: 'Test',
                         date: '11.01.2011')

    it { expect(event.description.body.html_safe).to include('Test') }
  end

  context 'Validations' do
    event = Event.create(description: 'Test',
                         date: '11.01.2011')

    it 'cant create Event without title' do
      event = Event.create(description: 'Test',
                           date: '11.01.2011')

      expect(event).to_not be_valid
    end

    it 'cant create Event without description' do
      event = Event.create(title: 'First event',
                           date: '11.01.2011')

      expect(event).to_not be_valid
    end

    it 'cant create Event without date' do
      event = Event.create(title: 'First event',
                           description: 'Test')

      expect(event).to_not be_valid
    end
  end

  context 'filter by bublished events' do
    describe '.published' do
      it 'show only published events' do
        Event.create!(title: 'First event',
                      description: 'Test',
                      date: '11.01.2020',
                      publish: true)

        Event.create!(title: 'First event 2',
                      description: 'Test2',
                      date: '11.01.2020')

        expect(Event.published.size).to eq(1)
      end
    end
  end
end
