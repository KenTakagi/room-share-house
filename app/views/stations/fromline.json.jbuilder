json.array!(@stations) do |station|
  json.extract! station, :id, :line_id, :sort, :group_id, :zipcode,:address, :name, :pref_cd, :lon, :lat, :display_flg
  json.url station_url(station, format: :json)
end
