require_relative '../app/models/user'

describe User do
  subject(:user) {
     described_class.new(email: email, password: password)
    }
  let(:email) { 'test@tmail.com' }
  let(:password) { 'i_love_horses333' }

  it "should increment the count on creation" do
    expect{user}.to change{User.count}.by 1
  end

  it "should have an email address" do
    expect(user.email).to eq email
  end

  it "should have a password hash" do
    expect(user.password_hash).to eq password
  end
end
