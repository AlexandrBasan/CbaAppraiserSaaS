class CreateCapartments < ActiveRecord::Migration
  def change
    create_table :capartments do |t|
      t.integer :auction
      t.integer :tip_house
      t.integer :value_repair
      t.integer :storey
      t.integer :rooms
      t.decimal :adj_cost_value
      t.integer :apartment_id
      t.integer :anaprtment_id

      t.timestamps
    end
  end
end
