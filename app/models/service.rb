# == Schema Information
# Schema version: 20110223000935
#
# Table name: services
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  external_link :string(255)
#  desc          :string(255)
#  page_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Service < ActiveRecord::Base
	
	belongs_to :page
	attr_accessible :name, :external_link, :desc, :page_id
	

end
