class CreateCapartments < ActiveRecord::Migration
  def change
    create_table :capartments do |t|
      t.integer :auction
      t.integer :tip_house
      t.integer :value_repair
      t.integer :storey
      t.integer :rooms
      t.decimal :adj_cost_value
      t.decimal :median
      t.decimal :money_usd
      t.decimal :money_euro
      t.decimal :money_uah
      t.string :apartment_id
      t.string :anaprtment_id

      t.timestamps
    end
  end
end
