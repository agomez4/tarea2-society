class Frappuccino < Beverage

  def initialize
    super
    @price = 4000
    @time = 40
  end

  def price
    return @price * (1 + 0.05 * @number_of_condiments)
  end
end
