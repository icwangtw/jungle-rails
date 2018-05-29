require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "needs email to be unique and case-sensitive" do
      user0 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "a@b.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
      user1 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "a@b.com",
        password: "87654321",
        password_confirmation: "87654321"
      })
      user2 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "A@B.COM",
        password: "87654321",
        password_confirmation: "87654321"
      })
      expect(user0).to be_valid
      expect(user1).to_not be_valid
      expect(user2).to_not be_valid
    end
    it "needs to have First Name" do
      user3 = User.create({
        last_name: "Wang",
        email: "c@d.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
      expect(user3).to_not be_valid
      expect(user3.errors.full_messages).to eq(["First name can't be blank"])
    end
    it "needs to have Last Name" do
      user4 = User.create({
        first_name: "Wang",
        email: "e@f.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
      expect(user4).to_not be_valid
      expect(user4.errors.full_messages).to eq(["Last name can't be blank"])
    end
    it "needs to have email" do
      user5 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        password: "12345678",
        password_confirmation: "12345678"
      })
      expect(user5).to_not be_valid
      expect(user5.errors.full_messages).to eq(["Email can't be blank"])
    end
    it "needs to have a long enough password" do
      user6 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "g@h.com",
        password: "1234",
        password_confirmation: "1234"
      })
      expect(user6).to_not be_valid
      expect(user6.errors.full_messages).to eq(["Password is too short (minimum is 6 characters)"])
    end
    it "needs to have a password and confirmation" do
      user7 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "g@h.com",
        password: "12345678"
      })
      expect(user7).to_not be_valid
      expect(user7.errors.full_messages).to eq(["Password confirmation can't be blank"])
    end
  end

  describe '.authenticate_with_credentials' do
    it "needs to have a correct password" do
      user8 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "a@b.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
      expect(user8 == user8.authenticate_with_credentials("a@b.com", "12345678")).to be_truthy
    end
    it "will block log in with incorrect password" do
      user9 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "a@b.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
      expect(user9 == user9.authenticate_with_credentials("a@b.com", "87654321")).to be_falsey
    end
  end
end
