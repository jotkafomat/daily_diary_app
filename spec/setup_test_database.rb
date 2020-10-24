require 'pg'
def setup_test_database
  p "Setting up test database"

  connection = PG.connect(dbname: 'daily_diary_manager_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE diary_entries, comments")
end
