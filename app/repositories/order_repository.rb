class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    super(csv_file)
  end

  def undelivered_orders
    # orders.select { |order| !order.deliver? }
    orders.reject { |order| order.delivered? }
  end

  def save
    save_csv
  end

  private

  def orders
    @elements
  end

  def build_element(row)
    Order.new(
      id: row[:id].to_i,
      meal: @meal_repository.find(row[:meal_id].to_i),
      customer: @customer_repository.find(row[:customer_id].to_i),
      employee: @employee_repository.find(row[:employee_id].to_i),
      delivered: row[:delivered] == "true"
    )
  end
end
