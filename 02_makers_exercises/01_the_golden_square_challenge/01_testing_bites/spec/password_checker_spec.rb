require "password_checker"

describe PasswordChecker do
  it "validate password" do
    password = PasswordChecker.new
    expect(password.check("abcdefgh")).to eq true
  end

  it "raise error if password is not valid" do
    password = PasswordChecker.new
    expect {password.check("abc")}.to raise_error "Invalid password, must be 8+ characters."
  end
end