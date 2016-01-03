class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.references :chapter, index: true, foreign_key: true
      t.integer :rating, default: 0

      t.timestamps null: false
    end
  end
end
