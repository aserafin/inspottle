class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.column :name, :string, null: false
      t.attachment :icon
      t.timestamps
    end

    add_index :activities, :name, unique: true
  end
end
