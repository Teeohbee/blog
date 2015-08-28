require_relative 'user_management_spec'

feature 'Creating blogs' do
  before(:each) do
    user = build :user
    sign_up(user)
  end

  scenario 'I can create a new blog' do
    visit '/blogs/new'
    fill_in 'content', with: 'First blog'
    fill_in 'title', with: 'My First Blog'
    click_button 'Create Blog'
    expect(current_path).to eq '/blogs'
    within 'ul#blogs' do
      expect(page).to have_content('My First Blog')
    end
  end

  scenario ' I can see time stamps on blog posts' do
    user = User.first
    user.blogs.create(title: 'Test title', content: 'Test content', time: '14:11')
    visit '/blogs'
    expect(page.status_code).to eq 200
    within 'ul#blogs' do
      expect(page).to have_content('14:11')
    end
  end

  scenario 'there are no blogs in the database at the start of the test' do
    expect(Blog.count).to eq 0
  end

  scenario 'I cannot blog unless logged in' do
    click_button "Sign out"
    visit '/blogs/new'
    fill_in 'content', with: 'First blog'
    fill_in 'title', with: 'My First Blog'
    click_button 'Create Blog'
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content('Log in')
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

  scenario 'I cannot add an empty blog to the database' do
    user = build :user
    blog = build(:blog, content: "")
    sign_up(user)
    write_blog(user, blog)
    expect { write_blog(user, blog) }.to change(Blog, :count).by(0)
  end
end
