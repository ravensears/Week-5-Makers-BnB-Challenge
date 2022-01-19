feature 'spaces' do
  scenario 'listing a space' do
    visit '/spaces/new' 

    fill_in 'name', with: 'House on the Hills'
    fill_in 'description', with: '12 bedroom with own private beach'
    fill_in 'price', with: '1200 per week'
    click_button

    expect(page).to have_content 'House on the Hills'
  end

  scenario 'printing all spaces' do
    visit '/spaces/new' 

    fill_in 'name', with: 'House on the Hills'
    fill_in 'description', with: '12 bedroom with own private beach'
    fill_in 'price', with: '1200 per week'
    click_button

    expect(page).to have_content 'House on the Hills'
  end
end
