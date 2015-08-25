require './app/models/user.rb'

describe 'User'  do

  let!(:user) do
   User.create(username: 'juantest',
               password: '12345678',
               name: 'Juan Test',
               email: 'juan@test.com',
               password_confirmation: '12345678')
    end
  
  it 'can authenticate a genuine user' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user  
  end
  
  it 'can reject a fake user' do
    user = build :user
    authenticated_user = User.authenticate(user.email, "wrong")
    expect(authenticated_user).to eq nil 
  end

end