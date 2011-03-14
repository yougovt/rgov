class AddScribdToRequests < ActiveRecord::Migration
  def self.up
  	add_column :requests, :docID, :integer
  	add_column :requests, :access_key, :string
  	add_column :requests, :letter_type, :string 	
  	add_column :requests, :access, :string 	  
  	add_column :requests, :secret_password, :string
  end

  def self.down
  	remove_column :requests, :docID
  	remove_column :requests, :access_key
  	remove_column :requests, :letter_type
  	remove_column :requests, :access	  
  	remove_column :requests, :secret_password
  end
end
