class AddMedianToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :median, :decimal
  end
end
