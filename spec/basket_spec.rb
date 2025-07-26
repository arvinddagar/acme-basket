require_relative "../lib/basket"
require_relative "../lib/product"
require_relative "../lib/delivery_rules"
require_relative "../lib/offers/buy_one_get_half"

RSpec.describe Basket do
  let(:products) do
    [
      Product.new(code: "R01", name: "Red Widget", price: 32.95),
      Product.new(code: "G01", name: "Green Widget", price: 24.95),
      Product.new(code: "B01", name: "Blue Widget", price: 7.95)
    ]
  end

  let(:delivery) { DeliveryRules.new([[50, 4.95], [90, 2.95]]) }

  let(:offers) { [BuyOneGetSecondHalf.new("R01")] }

  let(:basket) { Basket.new(products: products, delivery_rules: delivery, offers: offers) }

  it "returns correct total for R01, R01" do
    basket.add("R01")
    basket.add("R01")
    expect(basket.total).to eq(54.38)
  end

  it "returns correct total for B01, G01" do
    basket.add("B01")
    basket.add("G01")
    expect(basket.total).to eq(37.85)
  end

  it "returns correct total for B01, B01, R01, R01, R01" do
    %w[B01 B01 R01 R01 R01].each { |code| basket.add(code) }
    expect(basket.total).to eq(98.28)
  end
end
