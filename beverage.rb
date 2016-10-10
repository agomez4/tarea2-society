class Beverage
  attr_reader :price, :time, :description
  attr_accessor :numberOfCondiments

  def initialize
    @numberOfCondiments = 0
  end

  def type
    return self.class.name
  end

  def getPrice
    return @price
  end

  def addNumberOfCondiments
    @numberOfCondiments+=1
  end

  def containsMilk
    return false
  end

  def isChocolate
    return false
  end

  def isEspresso
    return false
  end

  def isCapuccino
    return false
  end
end
