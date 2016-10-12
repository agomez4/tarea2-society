# beverages/macchiato.rb
class Macchiato < Beverage
  def initialize
    super
    @price = 5000
    @time = 50
  end

  def time
    random_number = rand
    total_time = @time
    while random_number < 0.1
      total_time += @time
      random_number = rand
    end
    total_time
  end
end
