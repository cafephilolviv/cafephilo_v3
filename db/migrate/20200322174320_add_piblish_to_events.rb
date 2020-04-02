class AddPiblishToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :publish, :bool, deafault: false
  end
end
