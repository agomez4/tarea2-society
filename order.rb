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

  def print
    @beverage_list.each do |bev|
      puts bev.type
      puts bev.price
      puts bev.time
    end
    puts '******************************************'
    puts 'RESUMEN ORDEN'
    puts name_to_show
    puts '******************************************'
    puts 'El precio total es: $' + @total_price.to_s
    puts 'El tiempo de preparacion es: ' + calculate_total_time.to_s + ' segundos'
  end

  def calculate_total_price
    @total_price = 0
    @beverage_list.each do |bev|
      @total_price += bev.price
      @total_price -= 200 if bev.contains_whole_milk
      @total_price += 300 if bev.contains_soy_milk
      if bev.contains_ice_cream
        @total_price += if rand < 0.5
                          100
                        else
                          500
                        end
      end
      if bev.contains_chocolate_condiment
        @total_price += 200 unless bev.chocolate?
      end
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
