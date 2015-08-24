feature 'Creating blogs' do

  scenario 'I can create a new blog' do
    visit '/blogs/new'
    save_and_open_page
    fill_in 'content', with: 'First blog'
    fill_in 'title', with: 'My First Blog'
    click_button 'Create Blog'
    expect(current_path).to eq '/blogs'
    within 'ul#blogs' do
      expect(page).to have_content('My First Blog')
    end
  end
end