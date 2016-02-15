class AddCategoryIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :category_id, :integer
  end
end
