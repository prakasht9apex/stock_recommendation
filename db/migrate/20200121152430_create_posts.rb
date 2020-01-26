class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :company_name
      t.string :description
      t.string :recommendation
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
