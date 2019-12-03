require "./input"
require "./product"

class Database
  def self.tranform_texts_to_products(file_name)
    @input = Input.new
    data = []
    
    product_array = @input.from_file(file_name)
    product_array.each_with_index do |x, i| 
      product = x.split(",").map(&:strip)
      data.push(Product.new(id: i + 1, name: product[3], price: product[4].to_f, sale_tax: product[1].to_f, import_tax: product[0].to_f))
    end

    data
  end
end