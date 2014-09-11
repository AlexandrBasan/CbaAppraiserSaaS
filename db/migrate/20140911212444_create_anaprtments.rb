class CreateAnaprtments < ActiveRecord::Migration
  def change
    create_table :anaprtments do |t|
      t.string :district_number
      t.string :numberpp
      t.string :location
      t.string :source
      t.decimal :area
      t.decimal :number_rooms
      t.decimal :cost_analogue_usd
      t.integer :floor
      t.integer :storeys
      t.string :building_type
      t.string :category_repair
      t.decimal :cost_one

      t.timestamps
    end
  end
end
