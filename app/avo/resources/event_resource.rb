class EventResource < Avo::BaseResource
  self.title = :title
  self.includes = []

  field :id, as: :id
  field :title, as: :text
  field :date, as: :date_time
  field :youtube_link, as: :text, hide_on: [:index] 
  field :description, as: :trix, hide_on: [:index]
  field :publish, as: :boolean
  field :speakers, as: :has_many, through: :event_speakers, hide_on: [:index]
  field :image, as: :file, is_image: true
end
