# == Schema Information
# Schema version: 20110313092613
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
#  permalink             :string(255)
#  verification_code     :string(255)
#

class Request < ActiveRecord::Base
	belongs_to :page
	belongs_to :user
	
	attr_accessible :first_name, :last_name, :street1, :street2, :pin, :city, :district, :state
	attr_accessible :email, :type, :sub, :body, :serial_number, :page_id
	
	
	#build in validations for RTI request form
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :page_id, :presence => true
	validates :sub, :presence => true
    validates :body, :presence => true, :length => { :minimum => 25 }
	validates :first_name, :presence => true, :length => { :maximum => 50 }
	validates :last_name, :presence => true, :length => { :maximum => 50 }
	validates :email, :presence => true,
                      :format   => { :with => email_regex }
    validates :street1, :presence => true
    validates :city, :presence => true
    validates :pin, :presence => true, :numericality => true
    validates :state, :presence => true
    
	def to_param
		"#{id}-#{permalink}"
  	end
  	
  	# need to figure out a way to change the status to 
  	# submitted from the UI
  	# def self.submit_request
  	#	request = find_by_id(id)
  	#	if request.verified?
  	#		request.submitted = true
  	#		request.save
  	#		UserMailer.request_submitted(request).deliver
  	#	end
    # end
    
end
