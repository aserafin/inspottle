class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :string, null: false
      t.column :email, :string, null: false
      t.column :facebook_id, :string, null: false
      t.column :facebook_token, :text, null: false
      t.column :auth_token, :string
      t.timestamps
    end

    add_index :users, :facebook_id, unique: true
    add_index :users, :auth_token, unique: true
    add_index :users, :email, unique: true
  end
end
