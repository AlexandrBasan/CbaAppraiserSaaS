json.array!(@auctions) do |auction|
  json.extract! auction, :id, :value
  json.url auction_url(auction, format: :json)
end
