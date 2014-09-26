json.array!(@cearths) do |cearth|
  json.extract! cearth, :id, :auction, :location, :infrastructure, :diff_area, :adj_cost_value, :median, :money_usd, :money_euro, :money_uah, :earth_id, :aneart_id
  json.url cearth_url(cearth, format: :json)
end
