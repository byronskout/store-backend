json.extract! basket_item, :id, :product_id, :basket_id, :created_at, :updated_at
json.url basket_item_url(basket_item, format: :json)
