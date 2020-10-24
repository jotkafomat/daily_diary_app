require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('daily_diary_manager_test')
else
  DatabaseConnection.setup 'daily_diary_manager'
end
