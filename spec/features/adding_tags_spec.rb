feature 'Adding tags' do
  scenario 'I can add a single tag to a new Blog' do
    visit '/blogs/new'
    fill_in 'content', with: 'First blog'
    fill_in 'title', with: 'My First Blog'
    fill_in 'tags', with: 'Tech'

    click_button 'Create Blog'
    blog = Blog.first
    expect(blog.tags.map(&:name)).to include('tech')
  end

  scenario 'I can add multiple tags to a new blog' do
     visit '/blogs/new'
     fill_in 'title', with: 'Title test'
     fill_in 'content', with: 'Title content'
     fill_in 'tags', with: 'space guns'
     click_button 'Create Blog'
     blog = Blog.first
     expect(blog.tags.map(&:name)).to include('space', 'guns')
 end

end
