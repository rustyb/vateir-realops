class AddDefaultAdminUser < ActiveRecord::Migration
  def self.up
    if !User.find_by_login('admin')
      User.create(:login => 'admin', :email => 'c.broderick@vateir.com',
                :password => 'v8t31r09', :password_confirmation => 'v8t31r09')
    end
  end
 
  def self.down
  end
end
