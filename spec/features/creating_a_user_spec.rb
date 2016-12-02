feature "creating new users" do


  scenario "visit signup page and create account with mismatching password" do
    visit '/users/new'
    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'password1234')
    fill_in('password_confirmation', with: 'passrhfhf')
    click_button('Submit')
    expect(User.all.count).to eq 0
  end

  scenario "visit signup page and create account with matching password" do
    visit '/users/new'
    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'password1234')
    fill_in('password_confirmation', with: 'password1234')
    click_button('Submit')
    expect(User.all.count).to eq 1
  end
end
