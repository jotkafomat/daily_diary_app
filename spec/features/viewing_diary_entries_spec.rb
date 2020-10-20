require 'pg'

feature ' Viewing diary entries' do
  scenario 'A user can see diary entries' do

    connection = PG.connect(dbname: 'daily_diary_manager_test')

    connection.exec("INSERT INTO diary_entries (content) VALUES ('First diary entries');")
    connection.exec("INSERT INTO diary_entries (content) VALUES ('Second diary entries');")
    connection.exec("INSERT INTO diary_entries (content) VALUES ('Third diary entries');")

    visit('/diary_entries')

    expect(page).to have_content "First diary entries"
    expect(page).to have_content "Second diary entries"
    expect(page).to have_content "Third diary entries"
  end
end
