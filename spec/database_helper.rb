require 'pg'

def persisted_data(id: , table: )
  connection = PG.connect(dbname: 'cherbnb_test')
  result = connection.exec("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end
