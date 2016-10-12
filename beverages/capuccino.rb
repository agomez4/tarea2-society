# beverages/capuccino.rb
class Capuccino < Beverage
  def initialize
    super
    @price = 1000
    @time = 10
  end

  def capuccino?
    true
  end

  def price
    @price + 100 * @number_of_condiments
  end
end
