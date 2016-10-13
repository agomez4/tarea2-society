# /order.rb
class Order
  attr_accessor :total_price

  def initialize(customer)
    @customer = customer
    @beverage_list = []
  end

  def add_beverage(beverage)
    @beverage_list << beverage
  end

  def special_condiment(bev)
    extra_price = 0
    extra_price -= 200 if bev.contains_whole_milk
    extra_price += 300 if bev.contains_soy_milk
    if bev.contains_ice_cream
      extra_price += if rand < 0.5
                       100
                     else
                       500
                     end
    end
    if bev.contains_chocolate_condiment
      extra_price += 200 unless bev.chocolate?
    end
    extra_price
  end

  def print
    puts '******************************************'
    puts 'RESUMEN ORDEN'
    puts name_to_show
    @beverage_list.each do |bev|
      puts "Beverge: #{bev.type}"
      puts "  Price: #{bev.price + special_condiment(bev)}"
      puts "  Time: #{bev.time}"
    end
    puts "El precio total es: $  #{@total_price}"
    puts "El tiempo de preparacion es:  #{calculate_total_time} segundos"
    puts '******************************************'
  end

  def calculate_total_price
    @total_price = 0
    @beverage_list.each do |bev|
      @total_price += bev.price
      @total_price += special_condiment(bev)
    end
  end

  def calculate_total_time
    total = 0
    @beverage_list.each do |bev|
      total += bev.time
    end
    total *= 0.8 if contains_espresso
    total
  end

  def contains_espresso
    @beverage_list.each do |bev|
      return true if bev.espresso?
    end
    false
  end

  def contains_chocolate
    @beverage_list.each do |bev|
      return true if bev.chocolate?
    end
    false
  end

  def contains_cream
    @beverage_list.each do |bev|
      return true if bev.contains_cream
    end
    false
  end

  def name_to_show
    name_to_show = @customer.name
    name_to_show = name_to_show.upcase if contains_chocolate
    if contains_cream
      newname_to_show = ''
      name_to_show.each_char do |i|
        newname_to_show += i + ' '
      end
      name_to_show = newname_to_show
    end
    name_to_show
  end
end
