class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @next_id = 1
    @meals = []
    load_csv if File.exist?(csv_file)
  end

  def all
    @meals
  end

  def add(meal)
    # receives a meal instance
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  # instance method
  def find(id)
    # find a ruby iterator
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      # create and push meal instance
      @meals << Meal.new(row)
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
    # @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << [:id, :name, :price]
      @meals.each do |meal|
        # csv << [meal.id, meal.name, meal.price]
        csv << meal.to_array
      end
    end
  end








end
