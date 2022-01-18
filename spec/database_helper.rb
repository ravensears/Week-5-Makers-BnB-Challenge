require 'pg'

def persisted_data(id)
  connection = PG.connect(dbname: 'cherbnb_test')
  result = connection.query("SELECT * FROM spaces WHERE id = #{id};")
  result.first
end