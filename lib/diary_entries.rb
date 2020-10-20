require 'pg'

class DiaryEntries

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_manager_test')
    else
      connection = PG.connect(dbname: 'daily_diary_manager')
    end

    result = connection.exec("SELECT * FROM diary_entries;")
    result.map { |entry| entry['content']}
  end

end
