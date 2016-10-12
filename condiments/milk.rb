# class milk. Overrides the contain milk method
class Milk < Decorator
  def contains_milk
    puts 'Ya tiene leche'
    true
  end
end
