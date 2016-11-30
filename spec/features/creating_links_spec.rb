<<<<<<< HEAD
require 'spec_helper'

  RSpec.feature "Add a link", :type=> :feature do

    scenario "Add a link" do
      visit('/links/new')
      fill_in('Title', with: 'The Guardian')
      fill_in('URL', with: 'www.theguardian.com/uk')
      click_button('Add Link')

      within 'ul#links' do
        expect(page).to have_content('The Guardian')
      end

    end

  end
=======
feature "creating a new bookmark" do
  scenario "Adding a bookmark with a title and url" do
    visit('/links/new')
    fill_in("title", :with => "Google")
    fill_in("url", :with => "https://www.google.co.uk")
    click_button("Save Link")
    expect(page).to have_text("Google")
  end
end
>>>>>>> d7cff8d6c08aeb934ef91e9ca5031dad48d6c11e
