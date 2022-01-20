feature 'Log in' do 
  scenario 'A registered user can log in' do
    User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')

    visit('/sessions/new')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('log in')

    expect(page).to have_content 'Welcome, test'
  end
end
