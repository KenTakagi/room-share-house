json.array!(@houses) do |house|
  json.extract! house, :name, :capacity, :owner_id, :note, :prefecture, :city, :town
  json.url house_url(house, format: :json)
end
