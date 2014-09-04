json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :code_provision, :new_code, :account_number, :alt_account_number, :tip, :region, :district, :type_settlement, :city, :street_type, :street_name, :room_apartment, :area, :floor_area, :number_rooms, :storey, :floors, :series_home, :district_number, :uah_market_value, :usd_market_value, :euro_market_value
  json.url apartment_url(apartment, format: :json)
end
