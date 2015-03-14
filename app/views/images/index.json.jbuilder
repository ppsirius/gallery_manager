json.array!(@images) do |image|
  json.extract! image, :id, :name, :description, :visible
  json.url image_url(image, format: :json)
end
