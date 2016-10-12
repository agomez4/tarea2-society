# condiments/chocolate_condiment.rb
class ChocolateCondiment < Decorator
  def price
    return @beverage.price if @beverage.chocolate?
    @beverage.price + 200
  end
end
