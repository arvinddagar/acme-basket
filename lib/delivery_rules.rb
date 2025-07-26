class DeliveryRules
  def initialize(rules)
    @rules = rules.sort_by { |limit, _| limit }
  end

  def charge(subtotal)
    @rules.each do |limit, cost|
      return cost if subtotal < limit
    end
    0.0
  end
end
