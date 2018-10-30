require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @next_id = 1
    @customers = []
    load_csv if File.exist?(csv_file)
  end

  def all
    @customers
  end

  def add(customer)
    # receives a customer instance
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  # instance method
  def find(id)
    # find a ruby iterator
    @customers.find { |customer| customer.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      # create and push customer instance
      @customers << Customer.new(row)
    end
    @next_id = @customers.last.id + 1 unless @customers.empty?
    # @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << [:id, :name, :address]
      @customers.each do |customer|
        # csv << [customer.id, customer.name, customer.price]
        csv << customer.to_array
      end
    end
  end
end
