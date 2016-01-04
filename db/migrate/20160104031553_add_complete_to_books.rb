class AddCompleteToBooks < ActiveRecord::Migration
  def change
    add_column :books, :complete, :boolean, default: false
  end
end
