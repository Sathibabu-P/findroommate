class Room < ActiveRecord::Base
	belongs_to :user
	has_many :pictures, :dependent => :destroy
	has_and_belongs_to_many :rules
	has_and_belongs_to_many :amenities
	validates :title,:description, presence: true
	ratyrate_rateable "features"
	acts_as_votable
end
