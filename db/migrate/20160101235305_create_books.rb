class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.text :tags
      t.integer :user_id
      t.integer :num_chapters, default: 0

      t.timestamps null: false
    end
  end
end
