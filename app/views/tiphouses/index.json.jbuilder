json.array!(@tiphouses) do |tiphouse|
  json.extract! tiphouse, :id, :num_analog, :o1, :o2, :o3, :o4
  json.url tiphouse_url(tiphouse, format: :json)
end
