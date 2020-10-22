require 'diary_entries'
require 'database_helpers'

describe DiaryEntries do

  describe '.all' do
    it 'returns all diary entries' do

      # Add the test data
      diary_entry = DiaryEntries.create(content: 'First diary entries', title: 'First Title')
      DiaryEntries.create(content: 'Second diary entries', title: 'Second Title')
      DiaryEntries.create(content: 'Third diary entries', title: 'Third Title')

      diary_entries = DiaryEntries.all

      expect(diary_entries.length).to eq 3
      expect(diary_entries.first).to be_a DiaryEntries
      expect(diary_entries.first.id).to eq diary_entry.id
      expect(diary_entries.first.title).to eq diary_entry.title
      expect(diary_entries.first.content).to eq diary_entry.content
    end
  end

  describe '.create' do
    it 'creates a new diary entry' do
      entry = DiaryEntries.create(content: 'test diary entry', title: 'Test title')

      persisted_data = persisted_data(id: entry.id)

      expect(entry).to be_a DiaryEntries
      expect(entry.id).to eq persisted_data['id']
      expect(entry.title).to eq 'Test title'
      expect(entry.content).to eq 'test diary entry'
    end
  end

end
