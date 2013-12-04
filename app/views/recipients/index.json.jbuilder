json.array!(@recipients) do |recipient|
  json.extract! recipient, 
  json.url recipient_url(recipient, format: :json)
end
