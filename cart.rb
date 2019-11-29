require('./db')

class Cart
  ROUND_FACTOR = 1 / 0.05

  def initialize(catalog)
    @@products = {}
    @catalog = catalog
  end

  def add_item(id, quantity = 1)
    if is_product_exist_in_cart(id)
      set_quantity(id, quantity)
    else
      @@products[id] = quantity
    end
  end

  def remove_item(id)
    @@products.delete(id);
  end

  def is_product_exist_in_cart(id)
    @@products.has_key? (id)
  end

  def set_quantity(id, quantity)
    @@products[id] += quantity
  end

  def round_tax(amt)
    ((amt * ROUND_FACTOR).ceil / ROUND_FACTOR)
  end

  def compute_tax(product)
    tax = product.saleTax + product.importTax
    result = tax > 0 ? product.price * tax : 0.0
  end

  def show_detail
    total_tax = 0.0
    total_price = 0.0
    @@products.each do |id, quanity| 
      product = @catalog.select { |x| x.id == id }[0]
      product_tax = compute_tax(product)
      product_tax = round_tax(product_tax)
      product_price_with_tax = (product.price + product_tax)
      product_subtotal_price_with_tax = product_price_with_tax * quanity
      total_tax += product_tax
      total_price += product_subtotal_price_with_tax
      
      puts "#{quanity}, #{product.name}, #{product_price_with_tax.round(2)}" 
    end

    puts ""
    puts "Sales Taxes: #{total_tax.round(2)}"
    puts "Total: #{total_price.round(2)}"
  end
end
