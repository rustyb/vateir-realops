module CategoriesHelper

  def add_download_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :downloads, :partial => 'download', :object => Download.new
    end
  end

end
