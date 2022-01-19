require 'user'
require 'database_helper'

describe '.create' do
  it 'creates a new user' do
    user = User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')

    # persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.name).to eq 'test'
  end
end
