class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :code_provision
      t.string :new_code
      t.string :account_number
      t.string :alt_account_number
      t.string :tip
      t.string :region
      t.string :district
      t.string :type_settlement
      t.string :city
      t.string :street_type
      t.string :street_name
      t.string :number_house
      t.string :number_house2
      t.string :room_apartment
      t.decimal :area
      t.decimal :floor_area
      t.integer :number_rooms
      t.integer :storey
      t.integer :floors
      t.integer :series_home
      t.integer :district_number
      t.decimal :uah_market_value
      t.decimal :usd_market_value
      t.decimal :euro_market_value

      t.timestamps
    end
  end
end
