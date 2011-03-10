class AddVerificationCodeToRequest < ActiveRecord::Migration
  def self.up
  	add_column :requests, :verification_code, :string
  end

  def self.down
  	remove_column :requests, :verification_code
  end
end
