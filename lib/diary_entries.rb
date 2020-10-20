require 'pg'

class DiaryEntries

  def self.all
    connection = PG.connect(dbname: 'daily_diary_manager')
    result = connection.exec("SELECT * FROM diary_entries;")
    result.map { |entry| entry['content']}
  end

end
