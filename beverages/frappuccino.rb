# beverages/frappuccino.rb
class Frappuccino < Beverage
  def initialize
    super
    @price = 4000
    @time = 40
  end

  def price
    @price * (1 + 0.05 * @number_of_condiments)
  end
end
