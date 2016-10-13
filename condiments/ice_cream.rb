# condiments/iceCream.rb
class IceCream < Decorator
  @@price = 0
  @@description = 0

  def price
    @beverage.price + @@price
  end

  def contains_ice_cream
    true
  end
end
