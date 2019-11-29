require('./product')

$products_1 = [
  Product.new(1, 'book', 12.49, 0, 0),
  Product.new(2, 'music cd', 14.99, 0.10, 0),
  Product.new(3, 'chocolate bar', 0.85, 0, 0)
]

$products_2 = [
  Product.new(1, 'imported box of chocolates', 10.00, 0, 0.05),
  Product.new(2, 'imported bottle of perfume', 47.50, 0.10, 0.05)
]

$products_3 = [
  Product.new(1, 'imported bottle of perfume', 27.99, 0.10, 0.05),
  Product.new(2, 'bottle of perfume', 18.99, 0.10, 0),
  Product.new(3, 'packet of headache pills', 9.75, 0, 0),
  Product.new(4, 'box of imported chocolates', 11.25, 0, 0.05)
]