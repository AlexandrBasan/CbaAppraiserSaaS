class CreateAnaprtments < ActiveRecord::Migration
  def change
    create_table :anaprtments do |t|
      t.integer :district_number
      t.integer :numberpp
      t.string :location
      t.string :source
      t.decimal :area
      t.integer :number_rooms
      t.decimal :cost_analogue_usd
      t.integer :floor
      t.integer :storeys
      t.integer :building_type
      t.string :category_repair
      t.decimal :cost_one

      t.timestamps
    end
  end
end
