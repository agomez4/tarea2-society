class Chocolate < Beverage
  def initialize
    super
    @price = 2000
    @time = 20
  end

  def isChocolate
    return true
  end
end
