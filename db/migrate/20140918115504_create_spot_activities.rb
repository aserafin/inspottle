class CreateSpotActivities < ActiveRecord::Migration
  def change
    create_table :spot_activities do |t|
      t.integer :spot_id, null: false
      t.integer :activity_id, null: false

      t.timestamps
    end
  end
end
