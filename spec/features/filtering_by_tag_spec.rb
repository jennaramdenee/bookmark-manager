feature "filtering by tags" do

  before(:each) do
    Link.create(title: "Google", url: "www.google.com", tags: [Tag.first_or_create(tag_name: "search engine")])
    Link.create(title: "Yahoo", url: "www.yahoo.com", tags: [Tag.first_or_create(tag_name: "bubbles")] )
    Link.create(title: "Reddit", url: "www.reddit.com", tags: [Tag.first_or_create(tag_name: "bubbles")])
    Link.create(title: "BBC", url: "www.bbc.com", tags: [Tag.first_or_create(tag_name: "news")] )
  end

  scenario "find links which are tagged" do

    visit '/tags/bubbles'

    within 'ul#links' do
      expect(page).to have_content('Yahoo')
      expect(page).to have_content('Reddit')
      expect(page).not_to have_content('Google')
      expect(page).not_to have_content('BBC')
    end

  end

end
