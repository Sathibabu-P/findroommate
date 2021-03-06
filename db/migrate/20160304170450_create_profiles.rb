class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.string :gender
      t.string :dob
      t.string :occupation
      t.string :address
      t.string :myself
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
