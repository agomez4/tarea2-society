# milks/skimMilk.rb
class SkimMilk < Milk
  @@price = 0
  @@description = 0

  def price
    @beverage.price + @@price
  end

  def contains_skim_milk
    true
  end
end
