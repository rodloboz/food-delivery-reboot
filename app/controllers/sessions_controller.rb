require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @user = nil
    @view = SessionsView.new
  end

  def sign_in(counter = 1)
    # signs in a user
    # ask for username
    username = @view.ask_for_username
    # ask for password
    password = @view.ask_for_password
    # find employee with the same username
    @user = @employee_repository.find_by_username(username)
      # compare passwords
    if @user && @user.password == password
      @view.welcome_user
      @user
    else
      # else retry
      counter += 1
      @view.wrong_credentials
      counter <= 3 ? sign_in(counter) : :wrong_credentials
    end
  end

  def destroy_session
    # logs out a user
  end
end
