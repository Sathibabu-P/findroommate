class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :rooms
  devise :database_authenticatable, :trackable, :timeoutable
end
