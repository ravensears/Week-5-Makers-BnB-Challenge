require './lib/database_connection'

class Space

  attr_reader :id, :name, :description, :price, :start_date, :end_date

  def initialize(id:, name:, description:, price:, start_date:, end_date:)
    @id = id
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @end_date = end_date
  end

  def self.create(name:, description:, price:, start_date:, end_date:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description, price, start_date, end_date) VALUES($1, $2, $3, $4, $5) 
      RETURNING id, name, description, price, start_date, end_date", 
      [name, description, price, start_date, end_date]
      )
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], 
    price: result[0]['price'], start_date: result[0]['start_date'], end_date: result[0]['end_date'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    
    result.map do |space|
      Space.new(id: space['id'], name: space['name'], description: space['description'], 
      price: space['price'], start_date: space['start_date'], end_date: space['end_date'])
    end
  end

 # def self.available?(start_date:, end_date:)
 #   result = DatabaseConnection.query(
 #     "SELECT * FROM bookings
 #     WHERE id = $1
 #     AND (($2 BETWEEN start_date AND end_date) OR ($3 BETWEEN start_date AND end_date))
 #     OR bnb_id = $1 AND ((start_date BETWEEN $2 AND $3) OR (end_date BETWEEN $2 AND $3))
 #     ;",
 #     [start_date, end_date]
 #   )
 #   !result.any?
 # end
end
