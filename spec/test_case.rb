require "./cart"
require "./db"

describe "Check input data" do
  it "Input 1" do
    input_spec = [
      "1, book, 12.49",
      "1, music cd, 14.99",
      "1, chocolate bar, 0.85"
    ]
    input_data = []
    $products_1.each do |x| 
      input_data.push("1, #{x.name}, #{x.price}")
    end

    expect(input_data).to match_array(input_spec)
  end
end

describe "Check output data" do
  it "Output 1" do
    output_spec = [ 
      "1, book, 12.49", 
      "1, music cd, 16.49", 
      "1, chocolate bar, 0.85",
      "Sales Taxes: 1.50",
      "Total: 29.83"
    ]
    output_data = []

    @cart1 = Cart.new($products_1)
    @cart1.add_item($products_1[0].id)
    @cart1.add_item($products_1[1].id)
    @cart1.add_item($products_1[2].id)
    order1 = @cart1.order_detail

    order1["items"].each do |x|
      output_data.push("#{x["quantity"]}, #{x["name"]}, #{x["price_with_tax"]}")
    end
    sales_taxes = order1["meta"]["sales_taxes"]
    total = order1["meta"]["total"]
    output_data.push("Sales Taxes: #{sales_taxes}")
    output_data.push("Total: #{total}")
    expect(output_data).to match_array(output_spec)
  end
end