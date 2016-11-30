def sign_up
  visit '/'
  fill_in "email", with: 'test@tmail.com'
  fill_in "password", with: 'ilovetesting123'
  click_button 'submit'
end
