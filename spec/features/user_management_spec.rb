feature 'In order to sign up' do
 
  scenario 'There is a sign up page that needs my information' do
    visit '/users/new'
    expect(page).to have_content "Enter the following to sign up"
    expect(page).to have_content "Email"
    expect(page).to have_content "Username"
    expect(page).to have_content "Name"
    expect(page).to have_content "Phone Number"
    expect(page).to have_content "Password"
    expect(page).to have_button "Sign up"
  end

  scenario 'I can sign up as a new user' do
    visit '/users/new'
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, #{user.username}"
    expect(User.first.username).to eq(user.username)
  end

  def sign_up(user)
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :username, with: user.username
    fill_in :name, with: user.name
    fill_in :phone, with: user.phone
    fill_in :password, with: user.password
    fill_in :passwordconfirm, with: user.passwordconfirm
    click_button "Sign up"
  end
end
