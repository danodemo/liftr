class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :link, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps null: false
    end
  end
end
