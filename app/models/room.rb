class Room < ActiveRecord::Base
	belongs_to :user
	belongs_to :city
	belongs_to :area
	has_many :pictures, :dependent => :destroy
	has_and_belongs_to_many :rules
	has_and_belongs_to_many :amenities
	validates :title,:description,:room_type,:bedrooms,:bathrooms,:roomrent,:rooms_forrent,:available_from,:minimumstay,:current_roommates,:prefred_gender,:prefred_age,:prefred_occupation, :city_id, :area_id, presence: true
	ratyrate_rateable "features"
	acts_as_votable
end
