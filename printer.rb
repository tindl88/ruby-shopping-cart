require "csv"

class Printer
  def console(data)
    data["items"].each do |x|
      puts "#{x["quantity"]}, #{x["name"]}, #{x["price_with_tax"]}"
    end
    puts ""
    puts "Sales Taxes: #{data["meta"]["sales_taxes"]}"
    puts "Total: #{data["meta"]["total"]}"
  end

  def csv(data, file_name)
    CSV.open(file_name, "wb") do |row|
      data["items"].each do |x|
        row << [x["quantity"], x["name"], x["price_with_tax"]]
      end
      row << []
      row << ["Sales Taxes: #{data["meta"]["sales_taxes"]}"]
      row << ["Total: #{data["meta"]["total"]}"]
    end
  end
end