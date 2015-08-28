require_relative 'user_management_spec'

feature 'In order to add a comment to a post' do
  scenario 'There needs to be a comment box' do
    user = build :user
    blog = build :blog
    sign_up(user)
    write_blog(user, blog)
    expect(page).to have_content("Comment")
  end

  scenario 'I cannot comment unless I am signed in' do
    user = build :user
    blog = build :blog
    sign_up(user)
    click_button "Sign out"
    write_blog(user, blog)
    expect(current_path).to eq "/sessions/new"
  end

  scenario 'my comments are added txwo the database' do
    user = build :user
    blog = build :blog
    sign_up(user)
    write_blog(user, blog)
    expect { write_comment("sample comment") }.to change(Comment, :count).by(1)
  end

  scenario 'I cannot submit an empty comment' do
    user = build :user
    blog = build :blog
    sign_up(user)
    write_blog(user, blog)
    expect { write_comment("") }.to change(Comment, :count).by(0)
  end
end
