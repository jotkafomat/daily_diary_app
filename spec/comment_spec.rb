require 'database_helpers'

require 'comment'
require 'diary_entries'

describe Comment do
  describe '.create' do
    it 'creates new comment' do
      diary_entry = DiaryEntries.create(content: 'tets content', title: 'test title')
      comment = Comment.create(text: 'test comment', diary_entry_id: diary_entry.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data['id']
      expect(comment.text).to eq 'test comment'
    end
  end
  describe '.where' do
    it 'gets the relevant comments from the database' do
      diary_entry = DiaryEntries.create(content: 'tets content', title: 'test title')

      Comment.create(text: 'test comment', diary_entry_id: diary_entry.id)
      Comment.create(text: 'second test comment', diary_entry_id: diary_entry.id)

      comments = Comment.where(diary_entry_id: diary_entry.id)
      comment = comments.first

      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data['id']
      expect(comment.text).to eq 'test comment'
      expect(comment.diary_entry_id).to eq diary_entry.id

    end
  end
end
