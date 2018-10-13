module OrderHelper
  def is_cart_empty
    enhanced_cart.length > 0 ? 'cart' : 'empty_cart'
  end
end