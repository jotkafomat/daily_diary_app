feature 'Upadating a diary entry' do
  scenario 'A user can update a diary entry' do
    diary_entry = DiaryEntries.create(content:'Thats a content to update', title: 'note to update')

    visit('/diary_entries')

    expect(page).to have_content('note to update')

    first('.diary_entry').click_button 'Edit'

    expect(current_path).to eq "/diary_entries/#{diary_entry.id}/edit"

    fill_in('title', with: "note title updated")
    fill_in('content', with: "content updated")
    click_button('Submit')

    expect(current_path).to eq '/diary_entries'
    expect(page).not_to have_content('note to update')
    expect(page).to have_content('note title updated')
  end
end
