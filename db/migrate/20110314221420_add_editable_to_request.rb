class AddEditableToRequest < ActiveRecord::Migration
  def self.up
  	add_column :requests, :uneditable, :boolean
  end

  def self.down
  	remove_column :requests, :uneditable
  end
end
