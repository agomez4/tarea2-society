class Beverage
  attr_accessor :price, :time

  def type
    return self.class.name
  end

  def drink
    puts "drink"
  end
end
