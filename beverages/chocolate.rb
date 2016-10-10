class Chocolate < Beverage
  def initialize
    super
    @price = 200
    @time = 2
  end

  def isChocolate
    return true
  end
end
