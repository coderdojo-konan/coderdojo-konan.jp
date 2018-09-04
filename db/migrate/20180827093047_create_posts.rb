class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :title
      t.datetime :published_at
      t.integer :author_id
      t.string :slug

      t.timestamps
    end
  end
end
