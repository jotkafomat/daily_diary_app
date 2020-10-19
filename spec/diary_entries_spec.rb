require 'diary_entries'

describe DiaryEntries do
  describe '.all' do
    it 'returns all diary entries' do
      diary_entries = DiaryEntries.all

      expect(diary_entries).to include("First diary entries")
      expect(diary_entries).to include("Second diary entries")
      expect(diary_entries).to include("Third diary entries")
    end
  end
end
