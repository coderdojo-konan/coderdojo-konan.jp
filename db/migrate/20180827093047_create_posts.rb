class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :title
      t.datetime :published_at
      t.integer :user_id
      t.string :slug
      t.boolean :is_draft

      t.timestamps
    end
  end
end
