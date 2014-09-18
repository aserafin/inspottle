class SpotsAddCreatorIdColumn < ActiveRecord::Migration
  def change
    add_column :spots, :creator_id, :integer
    add_index :spots, :creator_id
  end
end
