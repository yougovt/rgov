# == Schema Information
# Schema version: 20110217032915
#
# Table name: pages
#
#  id           :integer         not null, primary key
#  orgname      :string(255)
#  jurisdiction :integer
#  city         :string(255)
#  state        :string(255)
#  function     :text
#  created_at   :datetime
#  updated_at   :datetime
#  external_url :string(255)
#

class Page < ActiveRecord::Base
	attr_accessible :orgname, :jurisdiction, :city, :state, :function, :external_url
	validates :orgname, :presence => true
	validates :city, :presence => true, :if => :is_city_agency?
	validates :state, :presence => true, :if => :is_state_agency?
	
	def is_city_agency?
  		jurisdiction == 1
	end

	def is_state_agency?
  		jurisdiction == 2
	end
	
end
