# milks/fatMilk.rb
class FatMilk < Milk
  def price
    @beverage.price - 200
  end
end
