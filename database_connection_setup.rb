require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  connection = PG.connect(dbname: 'daily_diary_manager_test')
else
  connection = PG.connect(dbname: 'daily_diary_manager')
end
