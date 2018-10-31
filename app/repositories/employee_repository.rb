class EmployeeRepository < BaseRepository
  def find_by_username(username)
    #                         instance of Employee
    employees.find { |employee| employee.username == username }
  end

  private

  def employees
    @elements
  end

  def build_element(row)
    Employee.new(
      id: row[:id].to_i,
      username:row[:username],
      password: row[:password],
      role: row[:role]
    )
  end
end
