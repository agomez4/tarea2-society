# condiments/cream.rb
class Cream < Decorator
  @@price = 0
  @@description = 0

  def price
    @beverage.price + @@price
  end

  def contains_cream
    true
  end
end
