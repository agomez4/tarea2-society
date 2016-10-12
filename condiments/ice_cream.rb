# condiments/iceCream.rb
class IceCream < Decorator
  def price
    if rand < 0.5
      @beverage.price + 100
    else
      @beverage.price + 500
    end
  end
end
