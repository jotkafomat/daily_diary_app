feature ' Viewing diary entries' do
  scenario 'A user can see diary entries' do
    visit('/diary_entries')

    expect(page).to have_content "First diary entries"
    expect(page).to have_content "Second diary entries"
    expect(page).to have_content "Third diary entries"
  end
end
