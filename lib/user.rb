require './lib/database_connection'

class User
  
  attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.create(name:, username:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password) 
      VALUES($1, $2, $3, $4) 
      RETURNING id, name;", [name, username, email, password]
    )
    User.new(id: result[0]['id'], name: result[0]['name'])
  end
end
