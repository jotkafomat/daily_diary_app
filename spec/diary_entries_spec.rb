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

      persisted_data = persisted_data(table: 'diary_entries', id: entry.id)

      expect(entry).to be_a DiaryEntries
      expect(entry.id).to eq persisted_data['id']
      expect(entry.title).to eq 'Test title'
      expect(entry.content).to eq 'test diary entry'
    end
  end

  describe '.delete' do
    it 'delete given bookmark' do
      entry = DiaryEntries.create(content: 'note to delete', title: 'bin note')

      DiaryEntries.delete(id: entry.id)

      expect(DiaryEntries.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the diary_entry with the given data' do
      diary_entry = DiaryEntries.create(content: 'test diary entry', title: 'Test title')
      updated_diary_entry = DiaryEntries.update(id: diary_entry.id, content: 'test diary entry updated', title: 'Test title updated')

      expect(updated_diary_entry).to be_a DiaryEntries
      expect(updated_diary_entry.id). to eq diary_entry.id
      expect(updated_diary_entry.title).to eq 'Test title updated'
      expect(updated_diary_entry.content).to eq 'test diary entry updated'
    end
  end

  describe '.find' do
    it 'return the requested diary_entry object' do
      diary_entry = DiaryEntries.create(content: 'test diary entry', title: 'Test title')

      result = DiaryEntries.find(id: diary_entry.id)

      expect(result).to be_a DiaryEntries
      expect(result.id).to eq diary_entry.id
      expect(result.title).to eq 'Test title'
      expect(result.content).to eq 'test diary entry'

    end
  end

  describe '#comments' do
    it 'return a list of comments on the diary entry' do
      diary_entry = DiaryEntries.create(content: 'test diary entry', title: 'Test title')
      DatabaseConnection.query("INSERT INTO comments (id, text, diary_entry_id) VALUES(1, 'Test comment', #{diary_entry.id})")

      comment = diary_entry.comments.first

      expect(comment.text).to eq "Test comment"
    end
  end

  let(:comment_class) { double (:comment_class) }

  describe '#comments' do
    it 'calls .where on the Comment class' do
      diary_entry = DiaryEntries.create(content: 'test diary entry', title: 'Test title')
      expect(comment_class).to receive(:where).with(diary_entry_id: diary_entry.id)

      diary_entry.comments(comment_class)
    end
  end

end
