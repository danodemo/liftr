class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    User.find_each do |u|
      u.password = "cookies"
      u.password_confirmation = "cookies"
      u.save!
    end
  end
    remove_column :users, :password, :string
end