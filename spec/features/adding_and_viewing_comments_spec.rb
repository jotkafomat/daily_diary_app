feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a diary entry' do
      diary_entry = DiaryEntries.create(content: 'test entry content', title: 'test entry title')

      visit '/diary_entries'
      first('.diary_entry').click_button 'Add Comment'

      expect(current_path).to eq "/diary_entries/#{diary_entry.id}/comments/new"

      fill_in 'comment', with: "test comment on this entry"
      click_button 'Submit'

      expect(current_path).to eq '/diary_entries'
      expect(first('.diary_entry')).to have_content 'test comment on this entry'
    end
  end
end
