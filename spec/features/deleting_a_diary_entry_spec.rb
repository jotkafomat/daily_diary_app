feature 'Deleting a diary entry' do
  scenario 'A user can delete a diary entry' do
    DiaryEntries.create(content:'Thats a content to delete', title: 'note to delete')
    visit('/diary_entries')
    expect(page).to have_content "note to delete"

    first('.diary_entry').click_button 'Delete'
    expect(current_path).to eq '/diary_entries'
    expect(page).not_to have_content "note to delete"
  end
end
