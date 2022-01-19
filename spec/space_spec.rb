require 'space'
require 'pg'

describe Space do
  describe '.create' do
    it 'adds a new space' do
      space = Space.create(name: "Cher's house", description: "It's fab", price: "2000")
      connection = PG.connect(dbname: 'cherbnb_test')
      data = persisted_data(space.id)

      expect(space).to be_a Space
      expect(space.id).to eq data['id']
      expect(space.name).to eq "Cher's house"
      expect(space.description).to eq "It's fab"
      expect(space.price).to eq "2000"
    end
  end
end
