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
    puts "******************************************"
    puts "RESUMEN ORDEN"
    puts getNameToShow
    puts "******************************************"
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

  def containsChocolate
    @beverageList.each do |bev|
      if (bev.isChocolate)
        return true
      end
    end
    return false
  end

  def containsCream
    @beverageList.each do |bev|
      if (bev.containsCream)
        return true
      end
    end
    return false
  end

  def getNameToShow
    nameToShow = @customer.name
    if (containsChocolate)
      nameToShow = nameToShow.upcase
    end
    if (containsCream)
      newNameToShow = ""
      nameToShow.each_char do |i|
        newNameToShow += i+" "
      end
      nameToShow = newNameToShow
    end
    return nameToShow
  end


end
