require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'daily_diary_manager_test')
  result = connection.query("SELECT * FROM diary_entries WHERE id = #{id};")
  result.first
end
