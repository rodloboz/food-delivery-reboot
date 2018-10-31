require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @view.display_elements(meals)
  end

  def add
    name = @view.ask_for(:name)
    price = @view.ask_for(:price).to_i
    meal = Meal.new(name: name, price: price)
    @meal_repository.add(meal)
  end
end
