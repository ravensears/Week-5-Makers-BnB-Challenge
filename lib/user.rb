require './lib/database_connection'

class User
  
  attr_reader :id, :name, :username, :password, :email

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @email = email
    @username = username
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password) 
      VALUES($1, $2, $3, $4) 
      RETURNING id, name, username, password, email;", [name, username, email, password]
    )
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")

    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'])

  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless result.any?
    
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'])
  end
end
