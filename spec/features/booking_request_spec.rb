feature 'New Booking Request' do
  scenario 'A registered user can request to book a space for the night' do
    space = Space.create(name: "Cher's house", description: "It's fab", price: "2000", start_date: "10/01/2022", end_date: "12/01/2022")
    visit "/spaces"
    click_on 'View Space'

    expect(current_path).to eq "/spaces/#{space.id}"
    click_on 'Request to book'

    expect(page).to have_content 'Your request was successfully submitted to Cher'
  end
end