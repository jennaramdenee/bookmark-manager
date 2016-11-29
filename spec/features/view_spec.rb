

feature "Viewing links on the homepage" do
  scenario "on loading" do
    visit "/"
    expect(page).to have_content "My Bookmarks"
  end

end
