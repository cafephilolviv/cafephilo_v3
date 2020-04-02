class AddPiblishToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :publish, :bool, default: false
  end
end
