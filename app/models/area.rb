class Area < ActiveRecord::Base
	belongs_to :city
	has_many :rooms, through: :city
	validates :name,:pincode,:city_id, presence: true
end
