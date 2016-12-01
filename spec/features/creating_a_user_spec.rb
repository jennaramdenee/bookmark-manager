feature "creating new users" do
  scenario "visit signup page and create a new user account" do

    visit '/users/new'

    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'password1234')

    click_button('Submit')

    expect(page).to have_current_path('/links')

    expect(page).to have_content('Welcome email@gmail.com!')
    
    expect(User.all.count).to eq 1

  end
end
