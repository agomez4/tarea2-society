# beverages/expresso.rb
class Espresso < Beverage
  @@price = 3000
  @@time = 30
  def initialize
    super
  end

  def espresso?
    true
  end

  def price
    @@price
  end

  def time
    @@time
  end
end
