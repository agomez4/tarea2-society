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
    csv.to_a.map { |row| row.to_hash }
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
    cond.class_variable_set(:@@description, data[:description])
  end

  def condiment_init
    array = read_csv('condiments.csv')
    array.each do |cond|
      case cond[:condiment].strip
      when 'Whole Milk'
        set_condiment(FatMilk, cond)
      when 'Skim Milk'
        set_condiment(SkimMilk, cond)
      when 'Soy Milk'
        set_beverage(SoyMilk, cond)
      when 'Cream'
        set_beverage(Cream, cond)
      when 'Ice Cream'
        set_beverage(IceCream, cond)
      when 'Chocolate'
        set_beverage(Chocolate, cond)
      else
        return nil
      end
    end
  end
end
