class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id = attributes[:id] # is an integer
    @meal = attributes[:meal] # is an instance of Meal
    @customer = attributes[:customer] # is an instance of Customer
    @employee = attributes[:employee] # is an instance of Employee
    @delivered = attributes[:delivered] || false
  end

  def delivered? # returns a boolean
    @delivered # is always true or false
  end

  def deliver! # destructive method
    @delivered = true
  end

  def self.headers
    %i[id delivered meal_id customer_id employee_id]
  end

  def to_s
    "Meal: #{@meal.name.capitalize} | Deliver to: #{@customer.name.capitalize} | Delivery by: #{@employee.username.capitalize} | Delivered: #{delivered? ? "[X]" : "[ ]"}"
  end

  def to_array
    [@id, @delivered, @meal.id, @customer.id, @employee.id]
  end
end
