feature 'signing in' do

  scenario "user can sign in" do
    User.create(email: "email@gmail.com", password: "password1234", password_confirmation: "password1234" )
    visit '/session/new'
    expect(page.status_code).to eq 200
    fill_in('email', with: 'email@gmail.com')
    fill_in('password', with: 'password1234')
    click_button('Submit')
    expect(page).to have_content('Welcome email@gmail.com')
  end


end
