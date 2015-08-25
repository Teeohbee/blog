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

  scenario ' I can see time stamps on blog posts' do
    Blog.create(title: 'Test title', content: 'Test content', time: '14:11')
    visit '/blogs'
    expect(page.status_code).to eq 200
    within 'ul#blogs' do
      expect(page).to have_content('14:11')
    end
  end

  scenario 'there are no blogs in the database at the start of the test' do
    expect(Blog.count).to eq 0
  end
end
