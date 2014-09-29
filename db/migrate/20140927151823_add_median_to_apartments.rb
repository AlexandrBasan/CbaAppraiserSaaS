class AddMedianToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :median, :decimal
  end
end
