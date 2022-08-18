# frozen_string_literal: true

class SpeakerResource < Avo::BaseResource
  self.title = :name
  self.includes = []

  field :id, as: :id, hide_on: [:index]
  field :first_name, as: :text
  field :last_name, as: :text
end
