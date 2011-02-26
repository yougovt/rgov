# == Schema Information
# Schema version: 20110225082734
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
#  leader       :string(255)
#  leader_title :string(255)
#  budget       :integer
#  budget_year  :string(255)
#  rtiscore     :integer
#

class Page < ActiveRecord::Base
		
	attr_accessible :orgname, :jurisdiction, :city, :state, :function, :external_url
	attr_accessible :leader, :leader_title, :budget, :budget_year, :rtiscore
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
	
end
