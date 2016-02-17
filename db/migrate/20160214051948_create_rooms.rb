class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :description
      t.string :room_type
      t.string :bedrooms
      t.string :bathrooms
      t.string :roomrent
      t.string :roomsfor_rent
      t.string :available_from
      t.string :minimumstay
      t.string :current_roommates
      t.string :prefred_gender
      t.string :prefred_age
      t.string :prefred_occupation      
      t.boolean :phonenumber_visibility
      t.belongs_to :user, index: true
      t.belongs_to :area, index: true
      t.timestamps null: false
    end
  end
end
