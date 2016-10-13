# beverages/macchiato.rb
class Macchiato < Beverage
  @@price = 5000
  @@time = 50
  def initialize
    super
  end

  def time
    random_number = rand
    total_time = @@time
    while random_number < 0.1
      total_time += @@time
      random_number = rand
    end
    total_time
  end

  def price
    @@price
  end
end
