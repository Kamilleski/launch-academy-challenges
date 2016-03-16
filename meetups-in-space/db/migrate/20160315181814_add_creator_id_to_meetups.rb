class AddCreatorIdToMeetups < ActiveRecord::Migration
  def change
    change_table :meetups do |table|
      table.integer :creator_id, null: false
    end
  end
end
