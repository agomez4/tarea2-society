class Machine
  @billsAndCoins
  @machine

  def initialize
    @billsAndCoins = {
      20000 => 3,
      10000 => 5,
      5000 => 4,
      2000 => 5,
      1000 => 8,
      500 => 5,
      100 => 10,
      50 => 5,
      10 => 100
    }
  end

  def self.getInstance
    if (!@machine)
      @machine = Machine.new
    end
    return @machine
  end


  def payOrder(order)
    while (order.totalPrice>=10)
      insertMoney(order)
    end
    giveChange(order)
    puts "Estado"
    printStatus(@billsAndCoins)
  end

  def insertMoney(order)
    puts "Faltan $#{order.totalPrice} por pagar, de que valor es el billete o moneda que va a ingresar?"
    billOrCoin = gets.chomp.to_i
    if (@billsAndCoins.has_key?(billOrCoin))
      @billsAndCoins[billOrCoin] += 1
      order.totalPrice -= billOrCoin
    else
      puts "Valor de billete o moneda invalido"
    end
  end

  def giveChange(order)
    moneyOwed = order.totalPrice * -1
    change = {
      20000 => 0,
      10000 => 0,
      5000 => 0,
      2000 => 0,
      1000 => 0,
      500 => 0,
      100 => 0,
      50 => 0,
      10 => 0
    }
    @billsAndCoins.each do |key, value|
      while (moneyOwed >= key && value > 0)
        moneyOwed -= key
        value -= 1
        change[key] += 1
      end
      @billsAndCoins[key] = value
    end
    puts "Vuelto: "
    printStatus(change)
  end

  def printStatus(hashOfBillsAndCoins)
    hashOfBillsAndCoins.each do |key, value|
      if (value > 0)
        puts key.to_s + " " + value.to_s
      end
    end
  end
end
