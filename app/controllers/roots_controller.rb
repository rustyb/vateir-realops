class RootsController < ApplicationController
  def index
    @pages = Page.find(:all, :conditions => ["name = 'home'", true])
  end
end
