class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.references :event
      t.references :user

      t.timestamps
    end
  end
end
