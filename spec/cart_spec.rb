require "./cart"
require "./database"
require "./spec/sale_tax_helper"

sale_tax_helper = SaleTaxHelper.new

list_of_product_1 = Database.tranform_texts_to_products('./input/input_1.txt')
list_of_product_2 = Database.tranform_texts_to_products('./input/input_2.txt')
list_of_product_3 = Database.tranform_texts_to_products('./input/input_3.txt')

describe "check input data" do
  context "input 1" do
    specify do
      input_spec = [
        "1, book, 12.49",
        "1, music cd, 14.99",
        "1, chocolate bar, 0.85"
      ]
      input_data = sale_tax_helper.input(list_of_product_1)
      expect(input_data).to match_array(input_spec)
    end
  end

  context "input 2" do
    specify do
      input_spec = [
        "1, imported box of chocolates, 10.00",
        "1, imported bottle of perfume, 47.50"
      ]
      input_data = sale_tax_helper.input(list_of_product_2)
      expect(input_data).to match_array(input_spec)
    end
  end

  context "input 3" do
    specify do
      input_spec = [
        "1, imported bottle of perfume, 27.99",
        "1, bottle of perfume, 18.99",
        "1, packet of headache pills, 9.75",
        "1, box of imported chocolates, 11.25"
      ]
      input_data = sale_tax_helper.input(list_of_product_3)
      expect(input_data).to match_array(input_spec)
    end
  end
end

describe "check output data" do
  it "output 1" do
    output_spec = [ 
      "1, book, 12.49", 
      "1, music cd, 16.49", 
      "1, chocolate bar, 0.85",
      "Sales Taxes: 1.50",
      "Total: 29.83"
    ]

    cart = Cart.new(list_of_product_1)
    cart.add_item(list_of_product_1[0].id)
    cart.add_item(list_of_product_1[1].id)
    cart.add_item(list_of_product_1[2].id)
    output_data = sale_tax_helper.output(cart.order_detail)
    expect(output_data).to match_array(output_spec)
  end

  it "output 2" do
    output_spec = [ 
      "1, imported box of chocolates, 10.50", 
      "1, imported bottle of perfume, 54.65", 
      "Sales Taxes: 7.65",
      "Total: 65.15"
    ]

    cart = Cart.new(list_of_product_2)
    cart.add_item(list_of_product_2[0].id)
    cart.add_item(list_of_product_2[1].id)
    output_data = sale_tax_helper.output(cart.order_detail)
    expect(output_data).to match_array(output_spec)
  end

  it "output 3" do
    output_spec = [ 
      "1, imported bottle of perfume, 32.19", 
      "1, bottle of perfume, 20.89", 
      "1, packet of headache pills, 9.75",
      "1, box of imported chocolates, 11.85",
      "Sales Taxes: 6.70",
      "Total: 74.68"
    ]

    cart = Cart.new(list_of_product_3)
    cart.add_item(list_of_product_3[0].id)
    cart.add_item(list_of_product_3[1].id)
    cart.add_item(list_of_product_3[2].id)
    cart.add_item(list_of_product_3[3].id)
    output_data = sale_tax_helper.output(cart.order_detail)
    expect(output_data).to match_array(output_spec)
  end
end