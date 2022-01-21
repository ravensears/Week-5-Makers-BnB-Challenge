require 'space'
require 'pg'

describe Space do
  describe '.create' do
    it 'adds a new space' do
      space = Space.create(name: "Cher's house", description: "It's fab", price: "2000", start_date: "01-05-2022", end_date: "01-06-2022")
      connection = PG.connect(dbname: 'cherbnb_test')
      data = persisted_data(table: "spaces", id: space.id)

      expect(space).to be_a Space
      expect(space.id).to eq data['id']
      expect(space.name).to eq "Cher's house"
      expect(space.description).to eq "It's fab"
      expect(space.price).to eq "2000"
      expect(space.start_date).to eq "01-05-2022"
      expect(space.end_date).to eq "01-06-2022"
    end
  end
end
