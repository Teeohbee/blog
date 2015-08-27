require 'byebug'

feature 'In order to sign up' do
  scenario 'There is a sign up page that needs my information' do
    visit '/users/new'
    expect(page).to have_content 'Enter the following to sign up'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Phone Number'
    expect(page).to have_content 'Password'
    expect(page).to have_button 'Sign up'
  end

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, #{user.username}"
    expect(User.first.username).to eq(user.username)
  end

  scenario 'After signing up, session persists' do
    user = build :user
    sign_up(user)
    visit '/users/new'
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'I can sign up as a new user with a confirmed password' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'I must have a username to sign up' do
    user = build(:user, username: '')
    expect { sign_up(user) }.to change(User, :count).by(0)
  end

  scenario 'username must be unique' do
    user = build(:user, email: 'test@test.com')
    user2 = build :user
    sign_up(user2)
    expect { sign_up(user) }.to change(User, :count).by(0)
  end

  scenario 'email must be unique' do
    user = build(:user, username: 'test')
    user2 = build :user
    sign_up(user2)
    expect { sign_up(user) }.to change(User, :count).by(0)
  end
end

feature 'As a registered user' do
  scenario 'I can sign in with the right password' do
    user = build :user
    sign_up(user)
    click_button 'Sign out'
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'I cannot sign in with the wrong password' do
    user = build :user
    user2 = build(:user, password: "wrong")
    sign_up(user)
    click_button 'Sign out'
    sign_in(user2)
    expect(page).to_not have_content "Welcome, #{user.username}"
  end

  scenario 'I can sign out' do
    user = build :user
    sign_up(user)
    click_button 'Sign out'
    expect(page).to_not have_content 'Welcome'
  end
end
