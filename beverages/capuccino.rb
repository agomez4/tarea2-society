class Capuccino < Beverage

  def initialize
    super
    @price = 100
    @time = 1
  end

  def isCapuccino
    return true
  end

  def getPrice
    return @price + 100*@numberOfCondiments
  end
end
