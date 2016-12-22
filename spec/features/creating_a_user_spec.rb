feature "creating new users" do

  scenario "visit signup page and create account with mismatching password" do
    visit '/users/new'
    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'password1234')
    fill_in('password_confirmation', with: 'passrhfhf')
    click_button('Submit')
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
    expect(User.all.count).to eq 0
  end

  scenario "visit signup page and create account with matching password" do
    visit '/users/new'
    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'password1234')
    fill_in('password_confirmation', with: 'password1234')
    click_button('Submit')
    expect(current_path).to eq '/links'
    expect(User.all.count).to eq 1
  end

  scenario "visit signup page and create account with no email" do
    visit '/users/new'
    fill_in('password', with: 'password1234')
    fill_in('password_confirmation', with: 'password1234')
    click_button('Submit')
    expect(current_path).to eq '/users'
    expect(User.all.count).to eq 0
  end

  scenario "visit signup page and create account with invalid email" do
    visit '/users/new'
    fill_in('email', with: 'emailgmail.com')
    fill_in('password', with: 'password1234')
    fill_in('password_confirmation', with: 'password1234')
    click_button('Submit')
    expect(current_path).to eq '/users'
    expect(User.all.count).to eq 0
  end

  scenario "A user can not sign up with an already registered email address" do
    visit '/users/new'
    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'password1234')
    fill_in('password_confirmation', with: 'password1234')
    click_button('Submit')

    visit '/users/new'
    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'password1234')
    fill_in('password_confirmation', with: 'password1234')
    click_button('Submit')

    expect(User.all.count).to eq 1
    expect(page).to have_content "Email is already taken"
  end

end
