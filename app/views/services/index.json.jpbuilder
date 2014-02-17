json.array!(@services) do |service|
  json.extract! service, :name, :address, :description, :status, :message
  json.url service_url(service, format: :json)
end
