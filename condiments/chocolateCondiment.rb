class ChocolateCondiment < Decorator
  def getPrice
    if (@beverage.isChocolate)
      return @beverage.getPrice
    else
      return @beverage.getPrice + 200
    end
  end
end
