# singleton to manage the money
class Machine
  def initialize
    @bills_and_coins = {
      20_000 => 3,
      10_000 => 5,
      5000 => 4,
      2000 => 5,
      1000 => 8,
      500 => 5,
      100 => 10,
      50 => 5,
      10 => 100
    }
  end

  def self.instance
    @machine = Machine.new unless @machine
    @machine
  end

  def pay_order(order)
    insert_money(order) while order.total_price >= 10
    give_change(order)
    puts 'Estado'
    print_status(@bills_and_coins)
  end

  def insert_money(order)
    puts "Faltan $#{order.total_price} por pagar "\
      'de que valor es el billete o moneda que va a ingresar?'
    bill_or_coin = gets.chomp.to_i
    if @bills_and_coins.key?(bill_or_coin)
      @bills_and_coins[bill_or_coin] += 1
      order.total_price -= bill_or_coin
    else
      puts 'Valor de billete o moneda invalido'
    end
  end

  def give_change(order)
    money_owed = order.total_price * -1
    change = {
      20_000 => 0,
      10_000 => 0,
      5000 => 0,
      2000 => 0,
      1000 => 0,
      500 => 0,
      100 => 0,
      50 => 0,
      10 => 0
    }
    @bills_and_coins.each do |key, value|
      while money_owed >= key && value > 0
        money_owed -= key
        value -= 1
        change[key] += 1
      end
      @bills_and_coins[key] = value
    end
    puts 'Vuelto: '
    print_status(change)
  end

  def print_status(hash_of_bills_and_coins)
    hash_of_bills_and_coins.each do |key, value|
      puts key.to_s + ' ' + value.to_s if value > 0
    end
  end
end
