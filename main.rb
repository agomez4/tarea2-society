require_relative 'beverage'
require_relative 'beverageCreator'
require_relative 'beverages/capuccino'
require_relative 'beverages/chocolate'
require_relative 'beverages/espresso'
require_relative 'beverages/frappuccino'
require_relative 'beverages/macchiato'
require_relative 'beverages/tea'
require_relative 'decorator'
require_relative 'condiments/chocolateCondiment'
require_relative 'condiments/cream'
require_relative 'condiments/iceCream'
require_relative 'condiments/milk'
require_relative 'condiments/milks/fatMilk'
require_relative 'condiments/milks/skimMilk'
require_relative 'condiments/milks/soyMilk'
require_relative 'customer'
require_relative 'order'
require_relative 'machine'

def welcome
  puts "Hola, Cual es tu nombre? "
  customer = Customer.new(gets.chomp)
  order = Order.new(customer)
  order = coffee_loop(order)
  order.calculateTotalPrice
  order.print
  machine = Machine.getInstance
  machine.payOrder(order)
end

def condiments_loop(chosenBeverage)
  continue = true
  while (continue)
    puts "Que condimentos desea agregar? (0 Ninguno 1 Leche entera 2 Leche descremada 3 Leche de soya 4 Crema 5 Helado 6 Chocolate)"
    updatedBeverage = BeverageCreator.update_beverage(chosenBeverage, gets.chomp)
    while (!updatedBeverage)
      puts "Que condimentos desea agregar? ingrese un valor valido (0 Ninguno 1 Leche entera 2 Leche descremada 3 Leche de soya 4 Crema 5 Helado 6 Chocolate)"
      updatedBeverage = BeverageCreator.update_beverage(chosenBeverage, gets.chomp)
    end
    chosenBeverage = updatedBeverage
    puts "Desea agregar otro condimento? (s/n)"
    if (gets.chomp == 'n')
      continue = false
    end
  end
  return chosenBeverage
end

def coffee_loop(order)
  continue = true
  while (continue)
    puts "Que desea? (1 Capuccino 2 Chocolate 3 Espresso 4 Frapuccino 5 Macchiato 6 Te)"
    chosenBeverage = BeverageCreator.create_beverage(gets.chomp)
    while (!chosenBeverage)
      puts "Que desea, ingrese un valor valido? (1 Capuccino 2 Chocolate 3 Espresso 4 Frapuccino 5 Macchiato 6 Te)"
      chosenBeverage = BeverageCreator.create_beverage(gets.chomp)
    end
    chosenBeverage = condiments_loop(chosenBeverage)
    puts "Se agrego un " + chosenBeverage.type
    order.addBeverage(chosenBeverage)
    puts "Desea agregar otro cafe? (s/n)"
    if (gets.chomp == 'n')
      continue = false
    end
  end
  return order
end

def customer_loop
  continue = true
  while (continue)
    welcome
    puts "Atender a otro cliente? (s/n)"
    if (gets.chomp == 'n')
      continue = false
    end
  end
end

customer_loop
