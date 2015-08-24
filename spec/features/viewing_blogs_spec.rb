require 'spec_helper'
require './data_mapper_setup'

feature 'Viewing Bloggs' do
  scenario 'I can see existing bloggs on the blogs page' do
    Blog.create(content: 'First Blog', title:'My First Blog')

    visit '/BlogsFeed'

    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('My First Blog')
    end
  end
end
