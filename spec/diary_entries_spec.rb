require 'diary_entries'

describe DiaryEntries do

  describe '.all' do
    it 'returns all diary entries' do
      connection = PG.connect(dbname: 'daily_diary_manager_test')
      # Add the test data
      connection.exec("INSERT INTO diary_entries (content) VALUES ('First diary entries');")
      connection.exec("INSERT INTO diary_entries (content) VALUES ('Second diary entries');")
      connection.exec("INSERT INTO diary_entries (content) VALUES ('Third diary entries');")

      diary_entries = DiaryEntries.all

      expect(diary_entries).to include("First diary entries")
      expect(diary_entries).to include("Second diary entries")
      expect(diary_entries).to include("Third diary entries")
    end
  end

  describe '.create' do
    it 'creates a new diary entry' do
      entry = DiaryEntries.create(content: 'test diary entry', title: 'Test title').first

      expect(entry['content']).to eq 'test diary entry'
      expect(entry['title']).to eq 'Test title'
    end
  end


end
