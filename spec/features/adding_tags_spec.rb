feature 'Adding tags' do

  scenario 'I can add a single tag to a new Blog' do
    visit '/blogs/new'
    fill_in 'content', with: 'First blog'
    fill_in 'title', with: 'My First Blog'
    fill_in 'tag', with: 'Tech'

    click_button 'Create Blog'
    blog = Blog.first
    expect(blog.tags.map(&:name)).to include('Tech')
  end
end
