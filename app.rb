require "./cart"
require "./database"

class SaleTaxApp
  def shopping_cart_1
    products_1 = Database.tranform_texts_to_products('./input/input_1.txt')
    cart1 = Cart.new(products_1)
    cart1.add_item(products_1[0].id)
    cart1.add_item(products_1[1].id)
    cart1.add_item(products_1[2].id)
    cart1.to_console
    cart1.to_csv("./output/ouput_1.csv")
  end
 
  def shopping_cart_2
    products_2 = Database.tranform_texts_to_products('./input/input_2.txt')
    cart2 = Cart.new(products_2)
    cart2.add_item(products_2[0].id)
    cart2.add_item(products_2[1].id)
    cart2.to_console
    cart2.to_csv("./output/ouput_2.csv")
  end

  def shopping_cart_3
    products_3 = Database.tranform_texts_to_products('./input/input_3.txt')
    cart3 = Cart.new(products_3)
    cart3.add_item(products_3[0].id)
    cart3.add_item(products_3[1].id)
    cart3.add_item(products_3[2].id)
    cart3.add_item(products_3[3].id)
    cart3.to_console
    cart3.to_csv("./output/ouput_3.csv")
  end
end

myApp = SaleTaxApp.new
puts "SALES TAXES"
puts "\n===================OUTPUT 1==================="
myApp.shopping_cart_1
puts "\n===================OUTPUT 2==================="
myApp.shopping_cart_2
puts "\n===================OUTPUT 3==================="
myApp.shopping_cart_3
