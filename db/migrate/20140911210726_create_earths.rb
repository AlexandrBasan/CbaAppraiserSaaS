class CreateEarths < ActiveRecord::Migration
  def change
    create_table :earths do |t|
      t.string :code_provision
      t.string :tip
      t.string :region
      t.string :district
      t.string :city
      t.string :street_type
      t.string :street_name
      t.string :street_name2
      t.string :number_home
      t.string :number_housing
      t.string :room_apartment
      t.decimal :total_area
      t.decimal :floor_area
      t.decimal :area_land
      t.integer :district_number
      t.string :category_repair
      t.decimal :uah_market_value
      t.decimal :usd_market_value
      t.decimal :euro_market_value

      t.timestamps
    end
  end
end
