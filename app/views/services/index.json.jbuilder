json.array!(@services) do |service|
  json.extract! service, :name, :url, :description, :status, :github, :server_id
  json.url service_url(service, format: :json)
end
