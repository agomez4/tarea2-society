require_relative 'beverage'
require_relative 'beverage_creator'
require_relative 'beverages/capuccino'
require_relative 'beverages/chocolate'
require_relative 'beverages/espresso'
require_relative 'beverages/frappuccino'
require_relative 'beverages/macchiato'
require_relative 'beverages/tea'
require_relative 'decorator'
require_relative 'condiments/chocolate_condiment'
require_relative 'condiments/cream'
require_relative 'condiments/ice_cream'
require_relative 'condiments/milk'
require_relative 'condiments/milks/fat_milk'
require_relative 'condiments/milks/skim_milk'
require_relative 'condiments/milks/soy_milk'
require_relative 'customer'
require_relative 'order'
require_relative 'machine'
require_relative 'store'

def condiments_loop(chosen_beverage)
  continue = true
  while continue
    puts 'Que condimentos desea agregar?
    (0 Ninguno 1 Leche entera 2 Leche descremada 3 Leche de soya'\
    ' 4 Crema 5 Helado 6 Chocolate)'
    updated_beverage = BeverageCreator.update_beverage(
      chosen_beverage, gets.chomp
    )
    until updated_beverage
      puts 'Que condimentos desea agregar?
      (0 Ninguno 1 Leche entera 2 Leche descremada 3 Leche de soya'\
      ' 4 Crema 5 Helado 6 Chocolate)'
      updated_beverage = BeverageCreator.update_beverage(
        chosen_beverage, gets.chomp
      )
    end
    chosen_beverage = updated_beverage
    puts 'Desea agregar otro condimento? (s/n)'
    continue = false if gets.chomp == 'n'
  end
  chosen_beverage
end

def coffee_loop(order)
  continue = true
  while continue
    puts 'Que desea?
    (1 Capuccino 2 Chocolate 3 Espresso 4 Frapuccino 5 Macchiato 6 Te)'
    chosen_beverage = BeverageCreator.create_beverage(gets.chomp)
    until chosen_beverage
      puts 'Que desea, ingrese un valor valido?
      (1 Capuccino 2 Chocolate 3 Espresso 4 Frapuccino 5 Macchiato 6 Te)'
      chosen_beverage = BeverageCreator.create_beverage(gets.chomp)
    end
    chosen_beverage = condiments_loop(chosen_beverage)
    puts 'Se agrego un ' + chosen_beverage.type
    order.add_beverage(chosen_beverage)
    puts 'Desea agregar otro cafe? (s/n)'
    continue = false if gets.chomp == 'n'
  end
  order
end

def attend_customer
  puts 'Hola, Cual es tu nombre? '
  customer = Customer.new(gets.chomp)
  order = Order.new(customer)
  order = coffee_loop(order)
  order.calculate_total_price
  order.print
  machine = Machine.instance
  machine.pay_order(order)
end

def customer_loop
  puts 'Inicalizando programa'
  store = Store.new
  store.beverage_init
  store.condiment_init
  # puts prices
  continue = true
  while continue
    attend_customer
    puts 'Atender a otro cliente? (s/n)'
    continue = false if gets.chomp == 'n'
  end
end

customer_loop
