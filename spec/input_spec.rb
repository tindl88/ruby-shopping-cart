require "./input"

input = Input.new

describe "function is_import_product" do
  it { expect(input.is_import_product("imported box of chocolates")).to eq(true) }
  it { expect(input.is_import_product("bottle of perfume")).to eq(false) }
end

describe "function is_sales_tax_exempt" do
  it { expect(input.is_sales_tax_exempt("1, book, 12.49")).to eq(true) }
  it { expect(input.is_sales_tax_exempt("1, music cd, 14.99")).to eq(false) }
end

describe "function get_import_tax" do
  it { expect(input.get_import_tax("1, imported box of chocolates, 10.00")).to eq(0.05) }
  it { expect(input.get_import_tax("1, music cd, 14.99")).to eq(0.0) }
end

describe "function get_sales_tax" do
  it { expect(input.get_sales_tax("1, imported bottle of perfume, 27.99")).to eq(0.1) }
  it { expect(input.get_sales_tax("1, imported box of chocolates, 10.00")).to eq(0.0) }
end
