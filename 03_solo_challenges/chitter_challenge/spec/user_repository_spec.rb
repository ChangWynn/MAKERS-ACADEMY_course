require "user_repository"
require "shared_context_spec"
require "bcrypt"

describe UserRepository do

  include_context "doubles setup"

  before { reset_users_table }
  before { reset_peeps_table }

  let(:user) { User.new }

  context "find_with_id" do
    it "returns the corresponding user given an id" do
      result = subject.find_with_id(1)
      expect(result.fullname).to eq "Chang Huynh"
      expect(result.username).to eq "changwynn"
      expect(result.email).to eq "huynhchang@gmail.com"
      expect(result.password).to eq "passworD+123"
      expect(result.peeps[0].content).to eq "How are you guys doing, today? @jdoe @mrbike"
    end
    it "return 'not found' if the user can not be found in the database" do
      result = subject.find_with_id(4)
      expect(result).to eq "not found"
    end
  end

  context ".find_with_text method" do
    it "returns the corresponding user given a username" do
      result = subject.find_with_text("changwynn")
      expect(result.fullname).to eq "Chang Huynh"
      expect(result.username).to eq "changwynn"
      expect(result.email).to eq "huynhchang@gmail.com"
      expect(result.password).to eq "passworD+123"
      expect(result.peeps[0].content).to eq "How are you guys doing, today? @jdoe @mrbike"
    end
    it "returns the corresponding user given an email address" do
      result = subject.find_with_text("huynhchang@gmail.com")
      expect(result.fullname).to eq "Chang Huynh"
      expect(result.username).to eq "changwynn"
      expect(result.email).to eq "huynhchang@gmail.com"
      expect(result.password).to eq "passworD+123"
      expect(result.peeps[0].content).to eq "How are you guys doing, today? @jdoe @mrbike"
    end
    it "returns 'not found' if the user can not be found in the database" do
      result = subject.find_with_text("terminator")
      expect(result).to eq "not found"
    end
  end

  context ".find_with_object method" do
    it "returns true if username already exist" do
      allow(user1).to receive(:username) { "changwynn" }
      allow(user1).to receive(:email) { "trash-garbage-bin@gmail.com" }
      result = subject.find_with_object(user1)
      expect(result).to eq "found"
    end
    it "returns true if email already exist" do
      allow(user1).to receive(:email) { "huynhchang@gmail.com" }
      result = subject.find_with_object(user1)
      expect(result).to eq "found"
    end
    it "returns false if user does not exist in the database" do
      result = subject.find_with_object(new_user)
      expect(result).to eq "not found"
    end
  end

  context ".create method" do
    it "adds a new user to the database" do
      subject.create(new_user)
      result = subject.find_with_text("wickedman")
      expect(result.fullname).to eq "John Wick"
      expect(result.username).to eq "wickedman"
      expect(result.email).to eq "imsowicked@gmail.com"
    end
    it "returns 'already exists' if the username is already registered" do
      user.fullname = "Chang Huynh"
      user.username = "changwynn"
      user.email = "trash-garbage-bin@gmail.com"
      user.password = "12345Abcde+"
      result = subject.create(user)
      expect(result).to eq "already exists"
    end
    it "returns 'already exists' if the email address is already registered" do
      user.fullname = "Chang Huynh"
      user.username = "chang-wynn"
      user.email = "huynhchang@gmail.com"
      user.password = "12345Abcde+"
      result = subject.create(user)
      expect(result).to eq "already exists"
    end
  end

  context ".update method" do
    it "updates the user's username" do
      sql = "UPDATE users SET username = $1 WHERE id = $2"
      sql_params = ["chang-wynn", 1]
      result = subject.update(sql, sql_params)
      expect(result).to eq "The user profile has been successfully updated."
      user = subject.find_with_text("chang-wynn")
      expect(user.fullname).to eq "Chang Huynh"
      expect(user.username).to eq "chang-wynn"
      expect(user.email).to eq "huynhchang@gmail.com"
    end
    it "updates the user's email address" do
      sql = "UPDATE users SET email = $1 WHERE id = $2"
      sql_params = ["chang@gmail.com", 1]
      result = subject.update(sql, sql_params)
      expect(result).to eq "The user profile has been successfully updated."
      user = subject.find_with_text("changwynn")
      expect(user.fullname).to eq "Chang Huynh"
      expect(user.username).to eq "changwynn"
      expect(user.email).to eq "chang@gmail.com"
    end
  end
  context ".update_password method" do
    it "returns with a message for current password incorrect" do
      subject.create(new_user)
      user = subject.find_with_id(4)
      current_password = "w1ck3d"
      new_password = "W1CK3D"
      result = subject.update_password(user, current_password, new_password)
      expect(result).to eq "Current password incorrect"
    end
    it "updates the password after a successfull password match check" do
      subject.create(new_user)
      user = subject.find_with_id(4)
      current_password = "w1ck3d+"
      new_password = "W1CK3D"
      result = subject.update_password(user, current_password, new_password)
      expect(result).to eq "Password successfully updated"

      previous = user.password
      updated = subject.find_with_id(4).password
      expect(previous == updated).to eq false
    end
  end

  describe ".delete method" do
    it "deletes the user account" do
      subject.create(new_user)
      result = subject.find_with_id(4)
      expect(result.fullname).to eq "John Wick"
      expect(subject.delete(4)).to eq "Account deleted"
      result = subject.find_with_id(4)
      expect(result).to eq "not found"
    end
  end
end
