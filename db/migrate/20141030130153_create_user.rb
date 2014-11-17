class CreateUser < ActiveRecord::Migration
  def change
    User.create!(first_name: 'Admin', last_name: 'User', user_name: 'admin', password: 'admin')
  end
end
