class ActivityAddIconColumns < ActiveRecord::Migration
  def change
    add_column :activities, :position, :integer, null: false, default: 1

    remove_attachment :activities, :icon

    add_attachment :activities, :icon_white
    add_attachment :activities, :icon_blue
  end
end
