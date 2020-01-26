class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :content
      t.string :link
      t.boolean :has_read, default: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
