feature 'Hello, world!' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Hello, world!"
  end
end
