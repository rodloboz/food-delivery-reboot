require 'byebug'
require 'csv'
require_relative 'app/models/meal'
require_relative 'app/models/customer'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'router'

meals_csv = 'data/meals.csv'
customers_csv = 'data/customers.csv'
meal_repository = MealRepository.new(meals_csv)
customer_repository = CustomerRepository.new(customers_csv)
meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
router = Router.new(meals_controller, customers_controller)

router.run
