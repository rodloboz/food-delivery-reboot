class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def self.headers
    %i[id name price]
  end

  def to_s
    "Name: #{@name.capitalize} | Price: #{@price}"
  end

  def to_array
    [@id, @name, @price]
  end

  # getter
  # def id
  #   @id
  # end

  # setter
  # def id=(id)
  #   @id = id
  # end
end
