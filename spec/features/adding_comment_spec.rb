require_relative 'user_management_spec'

feature 'In order to add a comment to a post' do


  scenario 'There needs to be a comment box' do
    user = build :user
    blog = build :blog
    sign_up(user)
    write_blog(user, blog)
    expect(page).to have_content("Comment Box")
  end

  scenario 'I cannot comment unless I am signed in' do
    user = build :user
    blog = build :blog
    sign_up(user)
    click_button "Sign out"
    write_blog(user, blog)
    expect(current_path).to eq "/sessions/new"
  end

  scenario 'my comments are added to the database' do
    user = build :user
    blog = build :blog
    sign_up(user)
    write_blog(user, blog)
    expect{ write_comment }.to change(Comment, :count).by(1)
  end

def write_blog(user, blog)
  visit '/blogs/new'
  fill_in :title, with: blog.title
  fill_in :content, with: blog.content
  fill_in :tag, with: 'sample'
  click_button 'Create Blog'
end

def write_comment()
  visit '/blogs'
  fill_in :reply, with: "Your blog has blown me apart"
  click_button 'Reply'
end

end 