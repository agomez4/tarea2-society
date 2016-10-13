# beverages/capuccino.rb
class Capuccino < Beverage
  @@price = 1000
  @@time = 10
  @@description = 10
  def initialize
    super
  end

  def capuccino?
    true
  end

  def price
    @@price + 100 * @number_of_condiments
  end

  def time
    @@time
  end
end
