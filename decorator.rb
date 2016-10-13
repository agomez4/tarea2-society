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

  def contains_whole_milk
    @beverage.contains_whole_milk
  end

  def contains_skim_milk
    @beverage.contains_skim_milk
  end

  def contains_soy_milk
    @beverage.contains_soy_milk
  end

  def contains_cream
    @beverage.contains_cream
  end

  def contains_ice_cream
    @beverage.contains_ice_cream
  end

  def contains_chocolate_condiment
    @beverage.contains_chocolate_condiment
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
