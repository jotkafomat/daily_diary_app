require 'pg'

feature ' Viewing diary entries' do
  scenario 'A user can see diary entries' do

    DiaryEntries.create(content: 'First diary entries', title: 'First Title')
    DiaryEntries.create(content: 'Second diary entries', title: 'Second Title')
    DiaryEntries.create(content: 'Third diary entries', title: 'Third Title')

    visit('/diary_entries')

    expect(page).to have_content "First Title"
    expect(page).to have_content "Second Title"
    expect(page).to have_content "Third Title"
  end
end
