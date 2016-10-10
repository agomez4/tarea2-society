class Macchiato < Beverage
  def initialize
    super
    @price = 5000
    @time = 50
  end

  def getTime
    randomNumber = rand
    totalTime = @time
    while (randomNumber < 0.1)
      totalTime += @time
      randomNumber = rand
    end
    return totalTime
  end
end
