require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.connect('cherbnb_test')
else
  DatabaseConnection.connect('cherbnb')
end
