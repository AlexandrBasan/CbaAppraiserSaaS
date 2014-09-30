class AddOtnerhousesToSystem < ActiveRecord::Migration
  def change
    add_column :systems, :location_house, :integer
    add_column :systems, :infrastructura_house, :integer
  end
end
