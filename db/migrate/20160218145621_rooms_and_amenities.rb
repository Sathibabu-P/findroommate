class RoomsAndAmenities < ActiveRecord::Migration
  def change  	
     create_table :amenities_rooms, id: false do |t|
      t.belongs_to :room, index: true
      t.belongs_to :amenity, index: true
    end
  end
end
