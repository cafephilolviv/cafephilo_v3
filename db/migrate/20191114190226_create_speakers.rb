class CreateSpeakers < ActiveRecord::Migration[6.0]
  def change
    create_table :speakers do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
