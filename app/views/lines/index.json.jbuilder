json.array!(@lines) do |line|
  json.extract! line, :name, :display_order
  json.url line_url(line, format: :json)
end
