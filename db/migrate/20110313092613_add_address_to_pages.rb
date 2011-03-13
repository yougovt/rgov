class AddAddressToPages < ActiveRecord::Migration
  def self.up
  	add_column :pages, :street1, :string
  	add_column :pages, :street2, :string
  	add_column :pages, :pin, :integer
  	add_column :pages, :district, :string
  	add_column :pages, :rti_payee, :string
  	add_column :pages, :rti_payable_at, :string
  	add_column :pages, :rti_amount, :integer
  end
  def self.down
  	remove_column :pages, :street1
  	remove_column :pages, :street2
  	remove_column :pages, :pin
  	remove_column :pages, :district
  	remove_column :pages, :rti_payee
  	remove_column :pages, :rti_payable_at
  	remove_column :pages, :rti_amount
  end
end
