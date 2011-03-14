# == Schema Information
# Schema version: 20110313092613
#
# Table name: pages
#
#  id             :integer         not null, primary key
#  orgname        :string(255)
#  jurisdiction   :integer
#  city           :string(255)
#  state          :string(255)
#  function       :text
#  created_at     :datetime
#  updated_at     :datetime
#  external_url   :string(255)
#  leader         :string(255)
#  leader_title   :string(255)
#  budget         :float
#  budget_year    :string(255)
#  rtiscore       :integer
#  rtiaddress     :string(255)
#  permalink      :string(255)
#  street1        :string(255)
#  street2        :string(255)
#  pin            :integer
#  district       :string(255)
#  rti_payee      :string(255)
#  rti_payable_at :string(255)
#  rti_amount     :integer
#

class Page < ActiveRecord::Base
		
	attr_accessible :orgname, :jurisdiction, :city, :state, :function, :external_url
	attr_accessible :leader, :leader_title, :budget, :budget_year
	attr_accessible :street1, :street2, :pin, :district
	attr_accessible :rti_payee, :rti_payable_at, :rtiscore, :rti_amount
	has_many :services, :dependent => :destroy
	accepts_nested_attributes_for :services, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	
	validates :orgname, :presence => true
	validates :city, :presence => true, :if => :is_city_agency?
	validates :state, :presence => true, :if => :is_state_agency?
	
	def is_city_agency?
  		jurisdiction == 1
	end

	def is_state_agency?
  		jurisdiction == 2
	end
	
	def to_param
		"#{id}-#{permalink}"
	end
end
