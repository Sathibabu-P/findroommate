class City < ActiveRecord::Base
	has_many :areas
	has_many :rooms
	validates :name, presence: true, uniqueness: true
end
