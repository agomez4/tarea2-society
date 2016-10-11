# /decorator.rb
class Decorator < Beverage
  def initialize(beverage)
    @beverage = beverage
    add_number_of_condiments
  end

  def type
    @beverage.type + ' + ' + self.class.name
  end

  def price
    @beverage.price
  end

  def time
    @beverage.time
  end

  def add_number_of_condiments
    @beverage.add_number_of_condiments
  end

  def contains_milk
    @beverage.contains_milk
  end

  def contains_cream
    @beverage.contains_cream
  end

  def chocolate?
    @beverage.chocolate?
  end

  def espresso?
    @beverage.espresso?
  end

  def capuccino?
    @beverage.capuccino?
  end
end
