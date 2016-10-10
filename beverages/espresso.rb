class Espresso < Beverage
  def initialize
    super
    @price = 3000
    @time = 30
  end

  def isEspresso
    return true
  end

end
