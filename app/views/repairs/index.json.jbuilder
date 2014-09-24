json.array!(@repairs) do |repair|
  json.extract! repair, :id, :high, :eurorepair, :advanced, :simple
  json.url repair_url(repair, format: :json)
end
