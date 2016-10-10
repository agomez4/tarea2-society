class Capuccino < Beverage

  def initialize
    super
    @price = 1000
    @time = 10
  end

  def isCapuccino
    return true
  end

  def getPrice
    return @price + 100*@numberOfCondiments
  end
end
