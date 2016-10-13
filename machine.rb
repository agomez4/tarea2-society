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
    not_ended = true
    initial_amount_due = order.total_price
    while not_ended
      insert_money(order) while order.total_price >= 10
      not_ended = !give_change(order)
      if not_ended
        puts 'No podemos dar vuelto a ese monto, tome toda su plata y vuelva a intentar denuevo'
        order.total_price = initial_amount_due
      end
    end
    # puts 'Estado'
    # print_status(@bills_and_coins)
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
    previous_bills_and_coins = {}
    @bills_and_coins.each do |key, value|
      previous_bills_and_coins[key] = value
      while money_owed >= key && value > 0
        money_owed -= key
        value -= 1
        change[key] += 1
      end
      @bills_and_coins[key] = value
    end
    if money_owed > 0
      @bills_and_coins = previous_bills_and_coins
      return false
    end
    puts 'Vuelto: '
    print_status(change)
    true
  end

  def print_status(hash_of_bills_and_coins)
    has_change = false
    hash_of_bills_and_coins.each do |key, value|
      if value > 0
        puts 'Se da ' + value.to_s + ' de $' + key.to_s
        has_change = true
      end
    end
    puts 'Pago exacto, por lo que no se va a entregar vuelto' unless has_change
  end
end
