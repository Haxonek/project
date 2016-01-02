class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.references :book, index: true, foreign_key: true
      t.text :body, default: ""
      t.string :title, default: ""
      t.string :description, default: ""
      t.string :tags, default: ""

      t.timestamps null: false
    end
  end
end
