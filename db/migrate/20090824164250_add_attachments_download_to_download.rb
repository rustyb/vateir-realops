class AddAttachmentsDownloadToDownload < ActiveRecord::Migration
  def self.up
    add_column :downloads, :download_file_name, :string
    add_column :downloads, :download_content_type, :string
    add_column :downloads, :download_file_size, :integer
    add_column :downloads, :download_updated_at, :datetime
  end

  def self.down
    remove_column :downloads, :download_file_name
    remove_column :downloads, :download_content_type
    remove_column :downloads, :download_file_size
    remove_column :downloads, :download_updated_at
  end
end
