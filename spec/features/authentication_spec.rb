feature 'authentication' do
  scenario 'users get an error for wrong email' do
    User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')
    
    visit('/sessions/new')
    fill_in('email', with: 'wrongemail@example.com')
    fill_in('password', with: 'wrongpassword123')
    click_button('log in')

    expect(page).not_to have_content 'Welcome, wrongemail@example.com'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'users get an error for wrong password' do
    User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')
    
    visit('/sessions/new')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'wrongpassword123')
    click_button('log in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user can sign out' do
    User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('log in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end
end