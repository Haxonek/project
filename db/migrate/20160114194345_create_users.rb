class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.text :description
      t.string :author_name
      t.integer :books, default: 0

      t.timestamps null: false
    end

    add_index :users, :username, unique: true
  end
end
