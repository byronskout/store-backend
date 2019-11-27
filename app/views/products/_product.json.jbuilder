json.extract! product, :id, :name, :description, :brand, :price, :stock_level, :created_at, :updated_at
json.url product_url(product, format: :json)
