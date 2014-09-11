json.array!(@anearts) do |aneart|
  json.extract! aneart, :id, :district_number, :analogs_address, :area, :purpose, :value_proposition_usd, :information_source, :value_proposition_usdone
  json.url aneart_url(aneart, format: :json)
end
