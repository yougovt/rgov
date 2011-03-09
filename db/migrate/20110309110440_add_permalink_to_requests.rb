class AddPermalinkToRequests < ActiveRecord::Migration
  def self.up
  	add_column :requests, :permalink, :string
  end

  def self.down
  	remove_column :requests, :permalink
  end
end
