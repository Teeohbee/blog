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

  scenario 'I cannot add a empty tag' do
    blog = build :blog
    visit '/blogs/new'
    fill_in :title, with: blog.title
    fill_in :content, with: blog.content
    fill_in :tags, with: " "
    click_button 'Create Blog'
    expect(blog.tags.map(&:reply)).not_to include(" ")
  end

end
