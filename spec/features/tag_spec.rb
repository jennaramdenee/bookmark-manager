feature "tags" do
  scenario "adding tags to links on creation" do
    visit '/links/new'
    fill_in "tags", with: "social, harambe, memes"
  end

end
