require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'cherbnb_test')
  connection.exec("TRUNCATE spaces;")
end
