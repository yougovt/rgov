class AddVerificationCodeToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :verification_code, :string
  	add_column :users, :verified, :boolean
  end

  def self.down
  	remove_column :users, :verification_code
  	remove_column :users, :verified
  end
end
