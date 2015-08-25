require 'spec_helper'
require './data_mapper_setup'

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

  scenario 'I can filter blogs by tags' do
    visit '/tags/Holidays'
    within 'ul#blogs' do
      expect(page).not_to have_content('Sport')
      expect(page).not_to have_content('Tech')
      expect(page).to have_content('Holidays')
      expect(page).to have_content('Holidays')
    end
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
end
