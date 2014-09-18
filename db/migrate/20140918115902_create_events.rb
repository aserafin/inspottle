class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.references :spot
      t.references :activity

      t.datetime :starts_at

      t.timestamps
    end
  end
end
