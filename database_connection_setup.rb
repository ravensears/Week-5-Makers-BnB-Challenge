require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('cherbnb_test')
else
  DatabaseConnection.setup('cherbnb')
end