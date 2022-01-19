feature 'feature tests with capybara' do
  scenario 'capybara can access route' do
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end
