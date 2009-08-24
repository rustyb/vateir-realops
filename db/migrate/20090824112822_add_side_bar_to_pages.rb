class AddSideBarToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :side_bar, :text
  end

  def self.down
    remove_column :pages, :side_bar
  end
end
