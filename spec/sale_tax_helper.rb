class SaleTaxHelper
  def input(catalog)
    input_data = []

    catalog.each do |x| 
      input_data.push("1, #{x.name}, #{"%.2f" % x.price}")
    end

    input_data
  end
  
  def output(order)
    output_data = []

    order["items"].each do |x| 
      output_data.push("#{x["quantity"]}, #{x["name"]}, #{x["price_with_tax"]}")
    end
    output_data.push("Sales Taxes: #{order["meta"]["sales_taxes"]}")
    output_data.push("Total: #{order["meta"]["total"]}")
    
    output_data
  end
end