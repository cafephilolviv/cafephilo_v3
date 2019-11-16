class AddLinksToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :youtube_link, :string
    add_column :events, :mixcloud_link, :string
  end
end
