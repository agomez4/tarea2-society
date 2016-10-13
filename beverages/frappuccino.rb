# beverages/frappuccino.rb
class Frappuccino < Beverage
  @@price = 4000
  @@time = 40
  def initialize
    super
  end

  def price
    @@price * (1 + 0.05 * @number_of_condiments)
  end

  def time
    @@time
  end
end
