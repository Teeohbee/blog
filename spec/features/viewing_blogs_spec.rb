require 'spec_helper'
require './data_mapper_setup'

feature 'Viewing Bloggs' do
  scenario 'I can see existing bloggs on the blogs page' do
  Blog.create(content: 'First Blog', title:'My First Blog')

    visit '/blogs'

    expect(page.status_code).to eq 200
    within 'ul#blogs' do
      expect(page).to have_content('My First Blog')
    end
  end

    before(:each) do
    Blog.create(content: 'This is a new blog',
                title: 'First Blog',
                tags: [Tag.first_or_create(name: 'Sport')])
    Blog.create(content: 'The tech industry',
                title: 'Tech News',
                tags: [Tag.first_or_create(name: 'Tech')])
    Blog.create(content: 'The best holiday',
                title: 'France is awesome',
                tags: [Tag.first_or_create(name: 'Holidays')])
    Blog.create(content: 'Never go abroad',
                title: 'England is wet',
                tags: [Tag.first_or_create(name: 'Holidays')])
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
