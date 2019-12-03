class Product
  attr_reader :id
  attr_reader :name
  attr_reader :price
  attr_reader :sale_tax
  attr_reader :import_tax

  def initialize(id:, name:, price:, sale_tax:, import_tax:)
    @id = id
    @name = name
    @price = price
    @sale_tax = sale_tax
    @import_tax = import_tax
  end
end