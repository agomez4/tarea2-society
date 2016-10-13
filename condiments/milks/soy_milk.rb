# milks/soyMilk.rb
class SoyMilk < Milk
  @@price = 0
  @@description = 0

  def price
    @beverage.price + @@price
  end

  def contains_soy_milk
    true
  end
end
