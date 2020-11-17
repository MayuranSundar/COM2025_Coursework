json.extract! phone, :id, :brand, :model, :size, :colour, :specifications, :image_url, :price, :created_at, :updated_at
json.url phone_url(phone, format: :json)
