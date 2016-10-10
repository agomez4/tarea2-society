class Frappuccino < Beverage

  def initialize
    super
    @price = 400
    @time = 4
  end

  def getPrice
    return @price * (1 + 0.05 * @numberOfCondiments)
  end
end
