class Capuccino < Beverage

  def initialize
    super
    @price = 1000
    @time = 10
  end

  def capuccino?
    return true
  end

  def price
    return @price + 100*@number_of_condiments
  end
end
