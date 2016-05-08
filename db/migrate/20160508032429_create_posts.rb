class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :year
      t.string :content
    end
  end
end
