class Category < ActiveRecord::Base
  after_update :save_downloads
  has_many :downloads, :dependent => :destroy
  attr_accessible :name, :description, :download_attributes, :existing_download_attributes, :new_download_attributes

  validates_presence_of :name
  validates_associated :downloads
  
  def new_download_attributes=(download_attributes)
    download_attributes.each do |attributes|
      downloads.build(attributes)
    end
  end



  def existing_download_attributes=(download_attributes)
    downloads.reject(&:new_record?).each do |download|
      attributes = download_attributes[download.id.to_s]
      if attributes
        download.attributes = attributes
      else
        downloads.delete(download)
      end
    end
  end
  
  def save_downloads
    downloads.each do |download|
      download.save(false)
    end
  end

end
