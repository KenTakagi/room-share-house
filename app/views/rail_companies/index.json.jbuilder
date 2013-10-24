json.array!(@rail_companies) do |rail_company|
  json.extract! rail_company, :rr_id, :name, :url, :company_type, :status, :sort
  json.url rail_company_url(rail_company, format: :json)
end
