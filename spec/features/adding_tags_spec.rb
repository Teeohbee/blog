feature 'Adding tags' do

  before(:each) do
    user = build :user
    sign_up(user)
  end

  scenario 'I can add a single tag to a new Blog' do
    user = User.first
    visit '/blogs/new'
    fill_in 'content', with: 'First blog'
    fill_in 'title', with: 'My First Blog'
    fill_in 'tags', with: 'Tech'
    click_button 'Create Blog'
    blog = user.blogs.first
    expect(user.blogs.tags.map(&:name)).to include('tech')
  end

  scenario 'I can add multiple tags to a new blog' do
    user = User.first
    visit '/blogs/new'
    fill_in 'title', with: 'Title test'
    fill_in 'content', with: 'Title content'
    fill_in 'tags', with: 'space guns'
    click_button 'Create Blog'
    blog = user.blogs.first
    expect(user.blogs.tags.map(&:name)).to include('space', 'guns')
  end

  def sign_up(user)
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :username, with: user.username
    fill_in :name, with: user.name
    fill_in :phone, with: user.phone
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

end
