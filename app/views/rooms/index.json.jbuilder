json.array!(@rooms) do |room|
  json.extract! room, :house_id, :name, :largeness, :kind, :facilities, :sex, :rent, :expense, :note, :enable, :nationality
  json.url room_url(room, format: :json)
end
