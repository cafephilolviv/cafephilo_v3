# frozen_string_literal: true

# == Schema Information
#
# Table name: event_speakers
#
#  id         :bigint           not null, primary key
#  event_id   :bigint
#  speaker_id :bigint
#

class EventSpeaker < ApplicationRecord
  belongs_to :event
  belongs_to :speaker
end
