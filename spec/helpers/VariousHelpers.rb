module VariousHelpers

  def write_blog(user, blog)
    visit '/blogs/new'
    fill_in :title, with: blog.title
    fill_in :content, with: blog.content
    fill_in :tags, with: 'sample'
    click_button 'Create Blog'
  end

  def write_comment(text)
    visit '/blogs'
    fill_in :reply, with: text
    click_button 'Reply'
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

  def sign_in(user)
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

end
