require "./tax"
require "./printer"

class Cart
  def initialize(catalog)
    @printer = Printer.new()
    @catalog = catalog
    @cart_items = {}
  end

  def add_item(id, quantity = 1)
    if is_product_exist_in_cart(id)
      set_quantity(id, quantity)
    else
      @cart_items[id] = quantity
    end
  end

  def remove_item(id)
    @cart_items.delete(id);
  end

  def is_product_exist_in_cart(id)
    @cart_items.has_key?(id)
  end

  def set_quantity(id, quantity)
    @cart_items[id] += quantity
  end

  def order_detail
    tax = Tax.new
    total_tax = 0.0
    total_price = 0.0

    items = []
    data = {}
    meta = {}

    @cart_items.each do |id, quantity| 
      product = @catalog.select { |x| x.id == id }[0]
      product_tax = tax.compute_tax(product.price, product.sale_tax, product.import_tax)
      product_tax_rounded = tax.round_tax(product_tax)
      product_price_with_tax = (product.price + product_tax_rounded)
      product_subtotal_price_with_tax = product_price_with_tax * quantity
      total_tax += product_tax_rounded
      total_price += product_subtotal_price_with_tax

      item = {}
      item["quantity"] = quantity
      item["name"] = product.name
      item["price_with_tax"] = sprintf("%.2f", product_price_with_tax)
      item["tax"] = product_tax
      item["tax_rounded"] = product_tax_rounded
      items.push(item)
    end

    meta["sales_taxes"] = sprintf("%.2f", total_tax)
    meta["total"] = sprintf("%.2f", total_price)
    data["items"] = items
    data["meta"] = meta

    data
  end

  def to_console
    @printer.console(order_detail)
  end

  def to_csv(file_name)
    @printer.csv(order_detail, file_name)
  end
end
