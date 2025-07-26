require_relative "product"
require_relative "delivery_rules"
require_relative "offers/buy_one_get_half"

class Basket
  def initialize(products:, delivery_rules:, offers:)
    @catalog = products
    @delivery = delivery_rules
    @offers = offers
    @items = []
  end

  def add(product_code)
    product = @catalog.find { |p| p.code == product_code }
    raise "Product not found: #{product_code}" unless product

    @items << product
  end

  def total
    subtotal = @items.sum(&:price)

    offer_discount = @offers.sum { |offer| offer.apply(@items) }

    after_discount = subtotal - offer_discount

    delivery_charge = @delivery.charge(after_discount)

    total = (after_discount + delivery_charge).round(2)
    total
  end
end
