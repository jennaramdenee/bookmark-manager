require 'spec_helper'
require 'database_cleaner'


feature "visiting the home page" do

  scenario "visit the home page and see our bookmarks" do
    Link.create(url: 'http//www.reddit.com', title: 'Reddit')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Reddit')
    end
  end

  scenario "create a new bookmark button" do
    visit '/'
    click_button('Create a bookmark')
    expect(page).to have_content('Title:')
  end

end
