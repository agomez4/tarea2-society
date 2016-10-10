class Frappuccino < Beverage

  def initialize
    super
    @price = 4000
    @time = 40
  end

  def getPrice
    return @price * (1 + 0.05 * @numberOfCondiments)
  end
end
