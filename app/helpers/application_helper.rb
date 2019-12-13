module ApplicationHelper
  def basket_count_visible
    if @basket.basket_items.count > 0
      return "<span>#{@basket.basket_items.count}</span>".html_safe
    end
  end

  def basket_has_products
    return @basket.basket_items.count > 0
  end
end
