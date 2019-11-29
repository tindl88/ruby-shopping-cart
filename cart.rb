class Cart
  @@products = {}

  def add_item(product_id, quantity = 1)
    @@products[product_id] = is_product_exist_in_cart(product_id) ? set_quantity(product_id, quantity) : quantity
  end

  def remove_item(product_id)
    @@products.delete(product_id);
  end

  def is_product_exist_in_cart(product_id)
    @@products.has_key? (product_id)
  end

  def set_quantity(product_id, quantity)
    @@products[product_id] += quantity
  end

  def show_detail
    @@products.each { |k, v| puts "product ID #{k} quantity #{v}" }
  end
end