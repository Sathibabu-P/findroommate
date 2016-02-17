class Room < ActiveRecord::Base
	belongs_to :user
	has_many :pictures, :dependent => :destroy
	validates :title,:description, presence: true
end
