require 'pg'

def persisted_data(id)
  connection = PG.connect(dbname: 'cherbnb_test')
<<<<<<< HEAD
  result = connection.query("SELECT * FROM users WHERE id = #{id};")
=======
  result = connection.query("SELECT * FROM spaces WHERE id = #{id};")
>>>>>>> 36bc38a12460860d0641f3af7beb061c8f01b6f2
  result.first
end
