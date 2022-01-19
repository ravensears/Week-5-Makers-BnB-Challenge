require 'database_connection'
require 'pg'

describe DatabaseConnection do 
  describe '.connect' do 
    it 'connects to database cherbnb_test' do
      expect(PG).to receive(:connect).with({ :dbname => "cherbnb_test" })
      DatabaseConnection.connect('cherbnb_test')
    end
  end

  describe '.query' do
    it 'executes sql queries' do 
      connection = DatabaseConnection.connect("cherbnb_test")
      # connection.exec("INSERT INTO spaces (description, name, price) VALUES('a nice place', 'House', '300');")
      expect(connection).to receive(:exec_params).with("SELECT * FROM spaces;", [])
      DatabaseConnection.query("SELECT * FROM spaces;", [])
    end
  end
end
