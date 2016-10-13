# beverages/chocolate.rb
class Chocolate < Beverage
  @@price = 2000
  @@time = 20
  def initialize
    super
  end

  def chocolate?
    true
  end

  def price
    @@price
  end

  def time
    @@time
  end
end
