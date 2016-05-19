json.array!(@year_levels) do |year_level|
  json.extract! year_level, :id, :name, :description
  json.url year_level_url(year_level, format: :json)
end
