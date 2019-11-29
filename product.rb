class Product
  attr_reader :id
  attr_reader :name
  attr_reader :price
  attr_reader :saleTax
  attr_reader :importTax

  def initialize(id, name, price, saleTax, importTax)
    @id = id
    @name = name
    @price = price
    @saleTax = saleTax
    @importTax = importTax
  end
end