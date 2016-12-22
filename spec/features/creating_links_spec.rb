require 'spec_helper'


feature "New links page" do

  scenario "Adding a bookmark for Google" do

    visit '/links/new'
    fill_in('title', with: 'Google')
    fill_in('URL', with: 'www.google.co.uk')
    click_button('Submit')

    within 'ul#links' do
      expect(page).to have_content('Google')
    end

  end



end
