require './product'

$products_1 = [
  Product.new(id: 1, name: 'book', price: 12.49, sale_tax: 0, import_tax: 0),
  Product.new(id: 2, name: 'music cd', price: 14.99, sale_tax: 0.10, import_tax: 0),
  Product.new(id: 3, name: 'chocolate bar', price: 0.85, sale_tax: 0, import_tax: 0)
]

$products_2 = [
  Product.new(id: 1, name: 'imported box of chocolates', price: 10.00, sale_tax: 0, import_tax: 0.05),
  Product.new(id: 2, name: 'imported bottle of perfume', price: 47.50, sale_tax: 0.10, import_tax: 0.05)
]

$products_3 = [
  Product.new(id: 1, name: 'imported bottle of perfume', price: 27.99, sale_tax: 0.10, import_tax: 0.05),
  Product.new(id: 2, name: 'bottle of perfume', price: 18.99, sale_tax: 0.10, import_tax: 0),
  Product.new(id: 3, name: 'packet of headache pills', price: 9.75, sale_tax: 0, import_tax: 0),
  Product.new(id: 4, name: 'box of imported chocolates', price: 11.25, sale_tax: 0, import_tax: 0.05)
]