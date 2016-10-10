class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name
    puts @name
  end

end
