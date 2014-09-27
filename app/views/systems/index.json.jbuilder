json.array!(@systems) do |system|
  json.extract! system, :id, :torg_apartment, :torg_earth, :torg_house, :floor_apartment
  json.url system_url(system, format: :json)
end
