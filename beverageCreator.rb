# beverageCreator
class BeverageCreator
  def self.create_beverage(type)
    case type
    when '1'
      return Capuccino.new
    when '2'
      return Chocolate.new
    when '3'
      return Espresso.new
    when '4'
      return Frappuccino.new
    when '5'
      return Macchiato.new
    when '6'
      return Tea.new
    else
      return nil
    end
  end

  def self.update_beverage(beverage, type)
    case type
    when '1'
      return FatMilk.new(beverage) unless beverage.contains_milk
      puts 'Ya tiene leche'
      return beverage

    when '2'
      return SkimMilk.new(beverage) unless beverage.contains_milk
      puts 'Ya tiene leche'
      return beverage
    when '3'
      return SoyMilk.new(beverage) unless beverage.contains_milk
      puts 'Ya tiene leche'
      return beverage
    when '4'
      return Cream.new(beverage)
    when '5'
      return IceCream.new(beverage)
    when '6'
      return ChocolateCondiment.new(beverage)
    when '0'
      return beverage
    else
      return nil
    end
  end
end
