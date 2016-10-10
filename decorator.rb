class Decorator < Beverage
  @beverage

  def initialize(beverage)
    @beverage = beverage
  end

  def type
    return @beverage.type + " + " + self.class.name
  end
end
