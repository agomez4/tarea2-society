# milks/fatMilk.rb
class FatMilk < Milk
  @@price = 0
  @@description = 0

  def price
    @beverage.price - 200
  end
end
