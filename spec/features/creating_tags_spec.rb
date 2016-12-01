require 'spec_helper'

feature "Creating tags" do
  scenario "Add a tag to a link" do

    visit '/links/new'
    fill_in('title', with: 'Google')
    fill_in('URL', with: 'www.google.co.uk')
    fill_in('tag_name', with: 'search engine')
    click_button('Submit')

    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('search engine')
  end
end
