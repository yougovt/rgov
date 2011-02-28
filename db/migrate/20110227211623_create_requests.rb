class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
	  t.integer :page_id
	  t.integer :user_id
	  t.string :first_name
	  t.string :last_name 
	  t.string :street1 
	  t.string :street2
	  t.integer :pin
	  t.string :city
	  t.string :district
	  t.string :state
	  t.string :email
	  t.integer :type
	  t.string :sub
	  t.text :body
	  t.string :serial_number
	  t.integer :payment_amount
	  t.string :payment_mode
	  t.string :payment_serial_number
	  t.string :payment_payable_at
	  t.boolean :verified  #once the user verifies email address and submits request
      t.boolean :submitted #once the request has been submitted by mail 
      t.datetime :submitdate
      t.timestamps
    end
  end

  def self.down
    drop_table :requests
    
  end
end
