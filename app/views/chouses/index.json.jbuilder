json.array!(@chouses) do |chouse|
  json.extract! chouse, :id, :auction, :location, :infrastructure, :diff_area, :category_repair, :adj_cost_value, :median, :money_usd, :money_euro, :money_uah, :house_id, :anhousehold_id
  json.url chouse_url(chouse, format: :json)
end
