require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "should have a password and password_confirmation" do
      user = User.new(
        name: "Xiang Li", email: "a@a.com", password: nil, password_confirmation: nil)
      user.save
      expect(user.errors.full_messages).to include("Password can't be blank" || "Password is too short (minimum is 3 characters)" || "Password confirmation can't be blank")                       
    end

    it "should not save if the passwords don't match" do
      user = User.new(
        name: "Xiang Li", email: "b@b.com", password: "password", password_confirmation: "passwords")
      user.save
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should not save without a valid email" do
      user = User.new(
        name: "Xiang Li", email: "email", password: "password", password_confirmation: "password")
      user.save
      expect(user.errors.full_messages).to include("Email is invalid")
    end
  
    it "should not save if the email exists" do
      
      user1 = User.new(
        name: "Xiang Li", email: "c@c.com", password: "password", password_confirmation: "password")
      user1.save

      user2 = User.new(
        name: "Xiang Li", email: "C@c.com", password: "password", password_confirmation: "password")
      user2.save

      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
  
    it "should not save if the password length is less than three characteres" do
      user = User.new(
        name: "Xiang Li", email: "d@d.com", password: "hi", password_confirmation: "hi")
      user.save
      expect(user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end


  describe '.authenticate_with_credentials' do
      
    it "should authenticate despite whitespace" do
      user = User.new(
        name: "Xiang Li", email: "e@e.com", password: "password", password_confirmation: "password")
      user.save
      expect(User.authenticate_with_credentials("  e@e.com  ", "password")).to eql(user)
    end

    it "should authenticate despite wrong case" do
      user = User.new(
        name: "Xiang Li", email: "f@f.com", password: "password", password_confirmation: "password")
      user.save
      expect(User.authenticate_with_credentials("F@f.com", "password")).to eql(user)
    end

  end
end