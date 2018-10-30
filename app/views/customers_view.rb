class CustomersView
  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name} : #{customer.address}"
    end
  end

  def ask_for(attr)
    puts "What's the #{attr} of the customer?"
    # input = gets.chomp
    # input.to_i if attr == :price
    gets.chomp
  end
end
