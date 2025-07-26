class BuyOneGetSecondHalf
  def initialize(product_code)
    @product_code = product_code
  end

  def apply(items)
    eligible = items.select { |item| item.code == @product_code }
    eligible_count = eligible.count

    return 0.0 if eligible_count < 2

    # Half price for every second eligible product
    half_price_count = eligible_count / 2
    half_price = eligible.first.price / 2.0
    discount = half_price_count * half_price
    discount
  end
end
