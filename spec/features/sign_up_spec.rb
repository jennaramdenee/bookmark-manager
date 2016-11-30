feature "Sign up" do
  scenario "should direct user to home page on sign up" do
    sign_up
    expect(current_path).to include 'links'
  end

  scenario "should display a welcome message" do
    sign_up
    expect(page).to have_content "Welcome"
    expect(page).to have_content "test@tmail.com"
  end
end
