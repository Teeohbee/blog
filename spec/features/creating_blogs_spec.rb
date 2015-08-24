feature 'Creating blogs' do
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

  scenario 'there are no blogs in the database at the start of the test' do
    expect(Blog.count).to eq 0
  end
end
