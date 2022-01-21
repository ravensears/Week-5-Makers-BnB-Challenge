require 'user'
require 'database_helper'

describe '.create' do
  it 'creates a new user' do
    user = User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')

    persisted_data = persisted_data(table: 'users', id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data['id']
    expect(user.name).to eq 'test'
  end

  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    user = User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')
  end
end

describe '.authenticate' do
  it 'returns a user given a correct username and password, if one exists' do
    user = User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')
    authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
    
    expect(authenticated_user.id).to eq user.id

  end

  it 'return nil given an incorrect email address' do
    User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')

    expect(User.authenticate(email: 'wrongemail@example.com', password: 'password123')).to be_nil
  end

  it 'return nil given an incorrect password' do 
    User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')

    expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword123')).to be_nil
  end
end

describe '.find' do
  it 'finds it by id' do
    user = User.create(name: 'test', username: 'test1', email: 'test@example.com', password: 'password123')
    
    persisted_data = persisted_data(table: 'users', id: user.id)
    user_2 = User.find(id: user.id)


    expect(user_2).to be_a User
    expect(user_2.id).to eq persisted_data['id']
    expect(user_2.name).to eq 'test'
    expect(user_2.username).to eq 'test1'
  end
end

