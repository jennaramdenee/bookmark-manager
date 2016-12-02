require_relative '../app/models/user'

describe User do

  let(:user) do
    User.create(email: "email@gmail.com", password: "password1234", password_confirmation: "password1234")
  end

  it "user is authenticated when given a valid email and password" do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end





end
