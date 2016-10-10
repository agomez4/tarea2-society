class Decorator < Beverage
  @beverage

  def initialize(beverage)
    @beverage = beverage
    addNumberOfCondiments
  end

  def type
    return @beverage.type + " + " + self.class.name
  end

  def getPrice
    return @beverage.getPrice
  end

  def getTime
    return @beverage.getTime
  end

  def addNumberOfCondiments
    @beverage.addNumberOfCondiments
  end

  def containsMilk
    return @beverage.containsMilk
  end

  def containsCream
    return @beverabe.containsCream
  end

  def isChocolate
    return @beverage.isChocolate
  end

  def isEspresso
    return @beverage.isEspresso
  end

  def isCapuccino
    return @beverage.isCapuccino
  end
end
