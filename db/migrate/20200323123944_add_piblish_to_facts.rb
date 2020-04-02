class AddPiblishToFacts < ActiveRecord::Migration[6.0]
  def change
    add_column :facts, :publish, :bool, default: false
  end
end
