class AddItemsearthToSystem < ActiveRecord::Migration
  def change
    add_column :systems, :location, :integer
    add_column :systems, :infrastructure, :integer
  end
end
