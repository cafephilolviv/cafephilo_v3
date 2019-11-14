class CreateEventSpeakers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_speakers do |t|
      t.belongs_to :event, index: true
      t.belongs_to :speaker, index: true
    end
  end
end
