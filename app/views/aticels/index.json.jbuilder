json.array!(@aticels) do |aticel|
  json.extract! aticel, :id, :name, :content, :published_on, :tags, :properties
  json.url aticel_url(aticel, format: :json)
end
