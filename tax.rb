class Tax
  def initialize(round_factor: 1 / 0.05)
    @round_factor = round_factor
  end

  def round_tax(amount)
    ((amount * @round_factor).ceil / @round_factor)
  end

  def compute_tax(product_price, sale_tax, import_tax)
    tax = sale_tax + import_tax
    tax > 0 ? product_price * tax : 0.0
  end
end