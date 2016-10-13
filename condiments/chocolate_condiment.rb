# condiments/chocolate_condiment.rb
class ChocolateCondiment < Decorator
  @@price = 0
  @@description = 0

  def price
    @beverage.price + @@price
  end

  def contains_chocolate_condiment
    true
  end
end
