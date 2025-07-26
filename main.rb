require_relative "lib/basket"
require_relative "lib/product"
require_relative "lib/delivery_rules"
require_relative "lib/offers/buy_one_get_half"

products = [
  Product.new(code: "R01", name: "Red Widget", price: 32.95),
  Product.new(code: "G01", name: "Green Widget", price: 24.95),
  Product.new(code: "B01", name: "Blue Widget", price: 7.95)
]

delivery = DeliveryRules.new([[50, 4.95], [90, 2.95]])

offers = [BuyOneGetSecondHalf.new("R01")]

basket = Basket.new(products: products, delivery_rules: delivery, offers: offers)

%w[R01 R01 G01].each { |code| basket.add(code) }

puts "Total: $#{basket.total}"
