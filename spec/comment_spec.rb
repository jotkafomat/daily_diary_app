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
end
