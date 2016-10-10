class IceCream < Decorator

  def getPrice
    if (rand < 0.5)
      @beverage.getPrice + 100
    else
      @beverage.getPrice + 500
    end
  end
end
