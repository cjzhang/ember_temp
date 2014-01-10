class CostCalculator 
  #@game's growth_rate
  COST_GROWTH_RATE = 1.2

  def self.check_quantity_costs(base_price, quantity_max=100)
    p "Checking costs for base price of #{base_price}"

    (quantity_max/5).times do |n|
      amount = 5*(n + 1)
      price = base_price*COST_GROWTH_RATE**amount
      p "Cost for the #{amount} unit: #{price}, #{ActiveSupport::NumberHelper.number_to_delimited price.to_i}"
    end
  end

end