class AddRoomsSystems < ActiveRecord::Migration
  def change
    add_column :systems, :rooms, :integer
  end
end
