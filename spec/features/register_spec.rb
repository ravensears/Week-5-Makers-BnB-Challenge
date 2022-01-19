# As a user,
# So that I can list spaces,
# I would like to register.

feature 'resgistration' do
  scenario 'a user can sign up' do
    visit('/users/new')
    fill_in 'name', with: 'test'
    fill_in 'username', with: 'test1'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'signup'

    expect(page).to have_content 'Welcome, test'
  end
end