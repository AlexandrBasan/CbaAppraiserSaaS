json.array!(@capartments) do |capartment|
  json.extract! capartment, :id, :auction, :tip_house, :value_repair, :storey, :rooms, :adj_cost_value, :median, :money_usd, :money_euro, :money_uah, :apartment_id, :anaprtment_id
  json.url capartment_url(capartment, format: :json)
end
