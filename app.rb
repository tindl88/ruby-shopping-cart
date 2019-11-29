require('./cart')
require('./db')

class SaleTaxApp
  def shopping_cart_1
    @cart1 = Cart.new($products_1)
    @cart1.add_item($products_1[0].id)
    @cart1.add_item($products_1[1].id)
    @cart1.add_item($products_1[2].id)
    @cart1.show_detail
  end
 
  def shopping_cart_2
    @cart2 = Cart.new($products_2)
    @cart2.add_item($products_2[0].id)
    @cart2.add_item($products_2[1].id)
    @cart2.show_detail
  end

  def shopping_cart_3
    @cart3 = Cart.new($products_3)
    @cart3.add_item($products_3[0].id)
    @cart3.add_item($products_3[1].id)
    @cart3.add_item($products_3[2].id)
    @cart3.add_item($products_3[3].id)
    @cart3.show_detail
  end
end

myApp = SaleTaxApp.new
puts "===================OUTPUT 1==================="
myApp.shopping_cart_1
puts "===================OUTPUT 2==================="
myApp.shopping_cart_2
puts "===================OUTPUT 3==================="
myApp.shopping_cart_3