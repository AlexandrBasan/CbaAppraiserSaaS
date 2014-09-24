json.array!(@kolrooms) do |kolroom|
  json.extract! kolroom, :id, :num_analog, :o1, :o2, :o3, :o4
  json.url kolroom_url(kolroom, format: :json)
end
