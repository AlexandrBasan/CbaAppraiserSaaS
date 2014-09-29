class AddMedianToEarths < ActiveRecord::Migration
  def change
    add_column :earths, :median, :decimal
  end
end
