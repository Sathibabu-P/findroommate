class RoomsAndRules < ActiveRecord::Migration
  def change
  	 create_table :rooms_rules, id: false do |t|
      t.belongs_to :room, index: true
      t.belongs_to :rule, index: true
    end
  end
end
