# beverage class from which all beverage inherit from
class Beverage
  attr_accessor :number_of_condiments, :price, :time, :description
  def initialize
    @number_of_condiments = 0
  end

  def type
    self.class.name
  end

  def add_number_of_condiments
    @number_of_condiments += 1
  end

  def contains_milk
    false
  end

  def contains_cream
    false
  end

  def chocolate?
    false
  end

  def espresso?
    false
  end

  def capuccino?
    false
  end
end
