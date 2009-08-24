class Page < ActiveRecord::Base
  attr_accessible :parent_id, :name, :content, :side_bar

  acts_as_tree

  validates_presence_of :name
end
