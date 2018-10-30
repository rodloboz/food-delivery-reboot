class MealsView
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} : €#{meal.price}"
    end
  end

  def ask_for(attr)
    puts "What's the #{attr} of the meal?"
    # input = gets.chomp
    # input.to_i if attr == :price
    gets.chomp
  end
end
