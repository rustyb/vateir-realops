class Download < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :description, :download, :download_file_name, :download_content_type, :download_file_size, :download_updated_at, :category_id

  has_attached_file :download

  validates_presence_of :name
end
