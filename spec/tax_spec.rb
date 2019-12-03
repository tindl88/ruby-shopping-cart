require "./tax"

tax = Tax.new

describe "function compute_tax" do
  context "if sale_tax > 0" do
    it { expect(tax.compute_tax(18.99, 0.10, 0)).to eq(1.899) }
  end

  context "if import_tax > 0" do
    it { expect(tax.compute_tax(11.25, 0, 0.05)).to eq(0.5625) }
  end

  context "if sale_tax > and import_tax > 0" do
    it { expect(tax.compute_tax(27.99, 0.10, 0.05)).to eq(4.1985) }
  end

  context "if sale_tax == 0 and import_tax == 0" do
    it { expect(tax.compute_tax(9.75, 0, 0)).to eq(0) }
  end
end

describe "function round_tax" do
  it { expect(tax.round_tax(6.66)).to eq(6.70) }
end