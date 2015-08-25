require_relative 'user_management_spec'

feature 'In order to add a comment to a post' do
   
    let(:blog) do
    Blog.new(content: 'John is a good guy', 
             title: 'Johnnyboy' 
             ) 
    end

  scenario 'There needs to be a comment box' do
    user = build :user
    sign_up(user)
    write_blog(user, blog)
    expect(page).to have_content("Comment Box")
  end

  xscenario 'I cannot comment unless I am signed in' do
  end

  xscenario 'my comments are added to the database' do
  end

def write_blog(user, blog)
  visit '/blogs/new'
  fill_in :title, with: blog.title
  fill_in :content, with: blog.content
  fill_in :tag, with: 'sample'
  click_button 'Create Blog'
end

end 