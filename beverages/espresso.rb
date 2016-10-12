# beverages/expresso.rb
class Espresso < Beverage
  def initialize
    super
    @price = 3000
    @time = 30
  end

  def espresso?
    true
  end
end
