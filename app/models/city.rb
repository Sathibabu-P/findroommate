class City < ActiveRecord::Base
	has_many :areas
	has_many :rooms
end
