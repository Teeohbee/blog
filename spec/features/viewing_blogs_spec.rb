require 'spec_helper'
require './data_mapper_setup'
require 'byebug'

feature 'Viewing Bloggs' do

  before(:each) do
    sign_up(build :user)
    user = User.first
    user.blogs.create(content: 'This is a new blog',
                      title: 'First Blog',
                      tags: [Tag.first_or_create(name: 'Sport')])
    user.blogs.create(content: 'The tech industry',
                      title: 'Tech News',
                      tags: [Tag.first_or_create(name: 'Tech')])
    user.blogs.create(content: 'The best holiday',
                      title: 'France is awesome',
                      tags: [Tag.first_or_create(name: 'Holidays')])
    user.blogs.create(content: 'Never go abroad',
                      title: 'England is wet',
                      tags: [Tag.first_or_create(name: 'Holidays')])
  end

  scenario 'I can see existing bloggs on the blogs page' do
    visit '/blogs'
    expect(page.status_code).to eq 200
    within 'ul#blogs' do
      expect(page).to have_content('This is a new blog')
    end
  end

   scenario 'when viewing a comment I can see associated comments' do
    user = build :user
    blog = build :blog
    sign_up(user)
    write_blog(user, blog)
    fill_in :reply, with: "Yo"
    expect(page).to have_content("Yo")
   end 

  scenario 'I can filter blogs by tags' do
    visit '/tags/Holidays'
    within 'ul#blogs' do
      expect(page).not_to have_content('Sport')
      expect(page).not_to have_content('Tech')
      expect(page).to have_content('Holidays')
      expect(page).to have_content('Holidays')
    end
  end
end
