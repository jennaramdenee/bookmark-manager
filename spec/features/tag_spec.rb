feature "tags" do
  scenario "adding tags to links on creation" do
    visit '/links/new'
    fill_in("title", :with => "BBC News")
    fill_in("url", :with => "https://www.bbc.co.uk/news")
    fill_in "tags", with: "news, london, tech"
    click_button "Save Link"

    expect(page).to have_content("BBC News")

  end

end
