require 'spec_helper'

feature "creating multiple tags" do
  scenario "add tags to link" do

    visit '/links/new'
    fill_in('title', with: 'Google')
    fill_in('URL', with: 'www.google.co.uk')
    fill_in('tag_name', with: 'search engine, useful, fun')
    click_button('Submit')

    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('search engine', 'useful', 'fun')
  end

  
end
