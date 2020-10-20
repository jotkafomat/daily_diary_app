feature 'Adding new diary entry' do
  scenario 'A user can add a bookmark to Daily Diary Manager' do
    visit('/diary_entries/new')
    fill_in('content', with: 'test diary entry')
    click_button('Submit')

    expect(page).to have_content 'test diary entry'
  end
end
