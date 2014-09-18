class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.column :name, :string, null: false
      t.column :latitude, :numeric, null: false
      t.column :longitude, :numeric, null: false
      t.column :short_description, :text
      t.column :address1, :string
      t.column :address2, :string
      t.column :post_code, :string
      t.column :city, :string
      t.column :country, :string

      t.timestamps
    end
  end
end
