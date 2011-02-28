# == Schema Information
# Schema version: 20110227211623
#
# Table name: requests
#
#  id                    :integer         not null, primary key
#  page_id               :integer
#  user_id               :integer
#  first_name            :string(255)
#  last_name             :string(255)
#  street1               :string(255)
#  street2               :string(255)
#  pin                   :integer
#  city                  :string(255)
#  district              :string(255)
#  state                 :string(255)
#  email                 :string(255)
#  type                  :integer
#  sub                   :string(255)
#  body                  :text
#  serial_number         :string(255)
#  payment_amount        :integer
#  payment_mode          :string(255)
#  payment_serial_number :string(255)
#  payment_payable_at    :string(255)
#  verified              :boolean
#  submitted             :boolean
#  submitdate            :datetime
#  created_at            :datetime
#  updated_at            :datetime
#

class Request < ActiveRecord::Base
	belongs_to :page
	belongs_to :user
	
	attr_accessible :first_name, :last_name, :street1, :street2, :pin, :city, :district, :state
	attr_accessible :email, :type, :sub, :body, :serial_number
	
	#build in validations for RTI request form

end
