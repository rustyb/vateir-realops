class AddCategoryIdToDownloads < ActiveRecord::Migration
  def self.up
    add_column :downloads, :category_id, :integer
  end

  def self.down
    remove_column :downloads, :category_id
  end
end
