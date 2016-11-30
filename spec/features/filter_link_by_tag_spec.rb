feature "filter links by tags" do

  before(:each){
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'course')])
    Link.create(url: 'http://www.imdb.com', title: 'IMDB',tags: [Tag.first_or_create(name: 'Film')])
    Link.create(url: 'http://ww.bbc.com', title: 'BBC News', tags: [Tag.first_or_create(name: 'bubbles')])
  }
  scenario "filter links by tags" do
    visit '/tags'
    visit '/tags/bubbles'

    expect(page).to have_content("BBC News")

  end
end
