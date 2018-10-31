class Router
  def initialize(controllers = {})
    @meals_controller = controllers[:meals_controller]
    @customers_controller = controllers[:customers_controller]
    @sessions_controller = controllers[:sessions_controller]
    @running    = true
    @user = nil
  end

  def run
    puts "Welcome to the Le Wagon Bistro!"
    puts "           --           "

    while @running
      # ask user to login
      @user = @sessions_controller.sign_in
      while @user
        if @user.role == "manager"
          display_manager_tasks
          action = gets.chomp.to_i
          print `clear`
          route_manager_action(action)
        else
          display_employee_tasks
          action = gets.chomp.to_i
          print `clear`
          route_employee_action(action)
        end
      end
    end
  end

  private

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then destroy_session
    when 0 then stop
    else
      puts "Please press 1 - 4"
    end
  end

  def route_employee_action(action)
    case action
    when 1 then ""
    when 2 then ""
    when 3 then ""
    when 4 then ""
    when 9 then destroy_session
    when 0 then stop
    else
      puts "Please press 1 - 4"
    end
  end

  def stop
    @running = false
  end

  def destroy_session
    @user = nil
  end

  def display_manager_tasks
    puts "###############################"
    puts "##      LE WAGON BISTRO.     ##"
    puts "###############################"
    puts "What do you want to do?"
    puts "1 - List all meals"
    puts "2 - Create a new meal"
    puts "3 - List all customers"
    puts "4 - Create a new customer"
    puts "9 - Logout"
    puts "0 - Stop and exit the program"
  end

  def display_employee_tasks
    puts "###############################"
    puts "##      LE WAGON BISTRO.     ##"
    puts "###############################"
    puts "What do you want to do?"
    puts "1 - List my undelivered orders"
    puts "2 - Mark order as delivered"
    puts "9 - Log out"
    puts "0 - Stop and exit the program"
  end
end
