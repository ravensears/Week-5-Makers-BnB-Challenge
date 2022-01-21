feature 'authentication' do
  scenario 'users get an error for wrong email or password' do
    User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')
    
    visit('/sessions/new')
    fill_in('email', with: 'wrongemail@example.com')
    fill_in('password', with: 'wrongpassword123')
    click_button('log in')

    expect(page).not_to have_content 'Welcome, wrongemail@example.com'
    expect(page).not_to have_content 'Please check your email or password'
  end
end