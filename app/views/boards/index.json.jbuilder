json.array!(@boards) do |board|
  json.extract! board, :user_id, :kind, :subject, :body, :prefecture, :city, :town, :sex, :deleted_at
  json.url board_url(board, format: :json)
end
