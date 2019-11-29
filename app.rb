require('./product')
require('./cart')

# List of products
$products = [
  Product.new(1, 'book', 12.49, 0, 0),
  Product.new(2, 'music cd', 14.99, 10, 0),
  Product.new(3, 'chocolate bar', 0.85, 0, 0)
]

class SaleTaxApp
  def initialize
    @cart1 = Cart.new
    @cart1.add_item($products[0].id)
    @cart1.add_item($products[1].id)
    @cart1.add_item($products[2].id)
  end

  def checkout
    @cart1.show_detail
  end
end

myApp = SaleTaxApp.new
myApp.checkout
