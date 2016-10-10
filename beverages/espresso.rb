class Espresso < Beverage
  def initialize
    super
    @price = 300
    @time = 3
  end

  def isEspresso
    return true
  end

end
