class Tax
  ROUND_FACTOR = 1 / 0.05

  def round_tax(amount)
    ((amount * ROUND_FACTOR).ceil / ROUND_FACTOR)
  end

  def compute_tax(product_price, sale_tax, import_tax)
    tax = sale_tax + import_tax
    result = tax > 0 ? product_price * tax : 0.0
  end
end