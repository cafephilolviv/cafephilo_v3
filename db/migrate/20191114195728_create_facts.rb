class CreateFacts < ActiveRecord::Migration[6.0]
  def change
    create_table :facts do |t|
      t.bigint :number
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
