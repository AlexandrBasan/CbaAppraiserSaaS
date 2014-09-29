class CreateChouses < ActiveRecord::Migration
  def change
    create_table :chouses do |t|
      t.integer :auction
      t.integer :location
      t.integer :infrastructure
      t.integer :diff_area
      t.integer :category_repair
      t.decimal :adj_cost_value
      t.integer :house_id
      t.integer :anhousehold_id

      t.timestamps
    end
  end
end
