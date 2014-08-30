json.array!(@tests) do |test|
  json.extract! test, :id, :col_1_s, :col_2_i
  json.url test_url(test, format: :json)
end
