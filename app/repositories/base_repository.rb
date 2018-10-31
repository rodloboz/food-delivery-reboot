class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @next_id = 1
    @elements = []
    load_csv if File.exist?(csv_file)
  end

  def all
    @elements
  end

  def add(element)
    # receives a customer instance
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      # self => MealRepository or CustomerRepository
      @elements << build_element(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      # @elements.first.class => Customer or Meal
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_array
      end
    end
  end
end
