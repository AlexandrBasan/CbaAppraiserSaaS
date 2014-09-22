json.array!(@currencies) do |currency|
  json.extract! currency, :id, :value, :symbol
  json.url currency_url(currency, format: :json)
end
