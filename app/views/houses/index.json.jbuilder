json.array!(@houses) do |house|
  json.extract! house, :id, :code_provision, :tip, :region, :district, :city, :street_type, :street_name, :street_name2, :namber_home, :number, :housing, :room_apartment, :total_area, :floor_area, :area_land, :district_number, :kategorіya_repair, :uah_market_value, :usd_market_value, :euro_market_value
  json.url house_url(house, format: :json)
end
