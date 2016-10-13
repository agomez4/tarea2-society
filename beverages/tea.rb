# beverages/tea.rb
class Tea < Beverage
  @@price = 6000
  @@time = 60
  def initialize
    super
  end

  def price
    @@price
  end

  def time
    @@time
  end
end
