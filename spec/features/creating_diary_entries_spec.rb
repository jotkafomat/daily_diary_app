feature 'Adding new diary entry' do
  scenario 'A user can add a bookmark to Daily Diary Manager' do
    visit('/diary_entries/new')
    fill_in('content', with: 'test diary entry')
    fill_in('title', with: 'Test title')
    click_button('Submit')

    expect(page).to have_content 'Test title'
  end
end
