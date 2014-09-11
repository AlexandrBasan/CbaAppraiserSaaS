json.array!(@anaprtments) do |anaprtment|
  json.extract! anaprtment, :id, :district_number, :numberpp, :location, :source, :area, :number_rooms, :cost_analogue_usd, :floor, :storeys, :building_type, :category_repair, :cost_one
  json.url anaprtment_url(anaprtment, format: :json)
end
