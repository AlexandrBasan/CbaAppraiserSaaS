class CreateCearths < ActiveRecord::Migration
  def change
    create_table :cearths do |t|
      t.integer :auction
      t.integer :location
      t.integer :infrastructure
      t.integer :diff_area
      t.decimal :adj_cost_value
      t.decimal :median
      t.decimal :money_usd
      t.decimal :money_euro
      t.decimal :money_uah
      t.integer :earth_id
      t.integer :aneart_id

      t.timestamps
    end
  end
end
