require_relative 'beverage'
require_relative 'beverage_creator'
require_relative 'beverages/capuccino'
require_relative 'beverages/chocolate'
require_relative 'beverages/espresso'
require_relative 'beverages/frappuccino'
require_relative 'beverages/macchiato'
require_relative 'beverages/tea'
require 'rubygems'
require 'open-uri'
require 'csv'

# Store for setting price from csv
class Store
  def initialize
  end

  def read_csv(uri)
    csv = CSV.new(open(uri),
                  :headers => true, :header_converters => :symbol, :converters => :all)
    csv.to_a.map {|row| row.to_hash }
  end

  def set_beverage(bev, data)
    bev.class_variable_set(:@@price, data[:price])
    bev.class_variable_set(:@@time, data[:time])
    bev.class_variable_set(:@@description, data[:description])
  end

  def beverage_init
    array = read_csv('beverages.csv')
    array.each do |beb|
      case beb[:beverage].strip
      when 'Capuccino'
        set_beverage(Capuccino, beb)
      when 'Chocolate'
        set_beverage(Chocolate, beb)
      when 'Espresso'
        set_beverage(Espresso, beb)
      when 'Frappuccino'
        set_beverage(Frappuccino, beb)
      when 'Macchiato'
        set_beverage(Macchiato, beb)
      when 'Tea'
        set_beverage(Tea, beb)
      else
        return nil
      end
    end
  end

  def set_condiment(cond, data)
    cond.class_variable_set(:@@price, data[:price])
    cond.class_variable_set(:@@time, data[:time])
    cond.class_variable_set(:@@description, data[:description])
  end

  def condiment_init
    array = read_csv('condiments.csv')
    puts array
    array.each do |cond|
      case cond[:condiment].strip
      when 'Whole Milk'
        set_condiment(FatMilk, cond)
      when 'Skim Milk'
        #set_beverage(Chocolate, beb)
        puts 2
      when 'Soy Milk'
        #set_beverage(Espresso, beb)
        puts 3
      when 'Cream'
        #set_beverage(Frappuccino, beb)
        puts 4
      when 'Ice Cream'
        #set_beverage(Macchiato, beb)
        puts 5
      when 'Chocolate'
        #set_beverage(Tea, beb)
        puts 6
      else
        return nil
      end
    end
  end
end
