feature 'spaces' do
  scenario 'listing a space' do
    visit '/spaces/new' 

    fill_in 'name', with: 'House on the Hills'
    fill_in 'description', with: '12 bedroom with own private beach'
    fill_in 'price', with: '1200 per week'
    fill_in 'start_date', with: '01-05-2022'
    fill_in 'end_date', with: '01-06-2022'
    click_button

    expect(page).to have_content 'House on the Hills'
    expect(page).to have_content '12 bedroom with own private beach'
    expect(page).to have_content '1200 per week'
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
