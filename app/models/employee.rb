class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def self.headers
    %i[id username password role]
  end

  def to_s
    "Name: #{@username} | Role: #{@role}"
  end

  # def to_array # called on save
  #   [@id, @username, @password, @role]
  # end
end
