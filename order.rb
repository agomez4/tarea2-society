class Order
  @beverageList
  @customer

  def initialize(customer)
    @customer = customer
    @beverageList = []
  end

  def addBeverage(beverage)
    @beverageList << beverage
  end

  def print
    @beverageList.each do |bev|
      puts bev.type
      puts bev.getPrice
      puts bev.getTime
    end
    puts "El precio total es: $" + calculateTotalPrice.to_s
    puts "El tiempo de preparacion es: " + calculateTotalTime.to_s + " segundos"
  end

  def calculateTotalPrice
    total = 0;
    @beverageList.each do |bev|
      total += bev.getPrice
    end
    return total
  end

  def calculateTotalTime
    total = 0
    @beverageList.each do |bev|
      total += bev.getTime
    end
    if (containsEspresso)
      total = total * 0.8
    end
    return total
  end

  def containsEspresso
    @beverageList.each do |bev|
      if (bev.isEspresso)
        return true
      end
    end
    return false
  end


end
