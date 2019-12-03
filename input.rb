class Input
  def initialize(import_tax: 0.05, sales_tax: 0.10, excludes: %w(pills chocolate book))
    @import_tax = import_tax
    @sales_tax = sales_tax
    @excludes = excludes
  end

  def from_file(file_name)
    arr = []

    File.foreach(file_name) { |line| 
      import_tax = get_import_tax(line)
      sales_tax = get_sales_tax(line)
      arr.push("#{import_tax}, #{sales_tax}, #{line}")
    }

    arr
  end

  def is_import_product(product)
    product.include? 'imported'
  end

  def  is_sales_tax_exempt(product)
    @excludes.any? { |x| product.include?(x) }
  end

  def get_import_tax(product)
    is_import_product(product) ? @import_tax : 0.0
  end

  def get_sales_tax(product)
    is_sales_tax_exempt(product) ? 0.0 : @sales_tax
  end 
end