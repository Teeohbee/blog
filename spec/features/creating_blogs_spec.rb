require_relative 'user_management_spec'

feature 'Creating blogs' do
  scenario 'I can create a new blog if signed' do
    user = build :user
    sign_up(user)
    visit '/blogs/new'
    fill_in 'content', with: 'First blog'
    fill_in 'title', with: 'My First Blog'
    click_button 'Create Blog'
    expect(current_path).to eq '/blogs'
    within 'ul#blogs' do
      expect(page).to have_content('My First Blog')
    end
  end

  scenario 'there are no blogs in the database at the start of the test' do
    expect(Blog.count).to eq 0
  end

  scenario 'I cannot add an empty blog to the database' do
    user = build :user
    blog = build(:blog, content:"")
    sign_up(user)
    write_blog(user, blog)
    expect { write_blog(user, blog) }.to change(Blog, :count).by(0)
  end 
end
