require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "needs email to be unique and case-sensitive" do
      user1 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "a@b.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
      user2 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "a@b.com",
        password: "87654321",
        password_confirmation: "87654321"
      })
      user3 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "A@B.COM",
        password: "87654321",
        password_confirmation: "87654321"
      })
      expect(user1).to be_valid
      expect(user2).to_not be_valid
      expect(user3).to_not be_valid
    end
    it "needs to have First Name" do
      user4 = User.create({
        last_name: "Wang",
        email: "c@d.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
      expect(user4).to_not be_valid
    end
    it "needs to have Last Name" do
      user5 = User.create({
        first_name: "Wang",
        email: "e@f.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
      expect(user5).to_not be_valid
    end
    it "needs to have email" do
      user6 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        password: "12345678",
        password_confirmation: "12345678"
      })
      expect(user6).to_not be_valid
    end
    it "needs to have a long enough password" do
      user7 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "g@h.com",
        password: "1234",
        password_confirmation: "1234"
      })
      expect(user7).to_not be_valid
    end
    it "needs to have a password and confirmation" do
      user8 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "g@h.com",
        password: "12345678"
      })
      expect(user8).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "needs to have a correct password" do
      user9 = User.create({
        first_name: "Stephen",
        last_name: "Wang",
        email: "a@b.com",
        password: "12345678",
        password_confirmation: "12345678"
      })
      expect(user9 == user9.authenticate_with_credentials("a@b.com", "12345678")).to be_truthy
    end
  end
end
