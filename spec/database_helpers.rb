require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'daily_diary_manager_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end
