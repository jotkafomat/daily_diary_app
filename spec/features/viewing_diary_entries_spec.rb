require 'pg'

feature ' Viewing diary entries list' do
  scenario 'A user can see diary entries' do

    DiaryEntries.create(content: 'First diary entries', title: 'First Title')
    DiaryEntries.create(content: 'Second diary entries', title: 'Second Title')
    DiaryEntries.create(content: 'Third diary entries', title: 'Third Title')

    visit('/diary_entries')

    expect(page).to have_content "First Title"
    expect(page).to have_content "Second Title"
    expect(page).to have_content "Third Title"
  end

  scenario 'A user can click on the title a see a content fo diary entry' do

    DiaryEntries.create(content: 'First diary entries', title: 'First Title')

    visit('/diary_entries')
    click_on "First Title"
    expect(page).to have_content('First diary entries')

  end
end
