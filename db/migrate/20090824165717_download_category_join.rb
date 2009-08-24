class DownloadCategoryJoin < ActiveRecord::Migration
  def self.up
  create_table :categories_downloads, :id => false do |t|
    t.integer :category_id
    t.integer :download_id
  end
end

  def self.down
  drop_table :categories_downloads
end
end
