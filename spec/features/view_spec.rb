feature "Viewing links on the homepage" do
  scenario "on loading" do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit "/links"
    expect(page).to have_content "Makers Academy"
  end

end
