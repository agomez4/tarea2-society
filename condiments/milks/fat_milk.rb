# milks/fatMilk.rb
class FatMilk < Milk
  @@price = 0
  @@description = 0

  def price
    @beverage.price + @@price
  end

  def contains_whole_milk
    true
  end
end
