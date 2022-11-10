require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should be created with password and password confirmation" do
      @user = User.new(first_name: "Tom", last_name: "Lo", email: "test@test.com", password: "123456", password_confirmation: "654321")
      expect(@user).to_not be_valid
      p @user.errors.full_messages
    end

    it "should have unique email" do
      @user = User.new(first_name: "Tom", last_name: "Lo", email: "test@test.com", password: "123456", password_confirmation: "123456")
      @user2 = User.new(first_name: "Kim", last_name: "Lee", email: "test@test.com", password: "123456", password_confirmation: "123456")
      @user.save
      @user2.save
      expect(@user2).to_not be_valid
      p @user2.errors.full_messages
    end

    it "should have email, first name, last name" do
      @user = User.new(first_name: nil, last_name: nil, email: nil, password: "123456", password_confirmation: "123456")
      expect(@user).to_not be_valid
      p @user.errors.full_messages
    end

    it "should have minimum length for password" do
      @user = User.new(first_name: "Tom", last_name: "Lo", email: "test@test.com", password: "1", password_confirmation: "1")
      expect(@user).to_not be_valid
      p @user.errors.full_messages
    end
  end

  describe '.authenticate_with_credentials' do
    it "should return correct user given their email and password" do
      @user = User.create(first_name: "Tom", last_name: "Lo", email: "test@test.com", password: "123456", password_confirmation: "123456")
      expect(User.authenticate_with_credentials("test@test.com", "123456")).to eql(@user)
    end

    it "should return correct user even if theres trailing spaces in the email" do
      @user = User.create(first_name: "Tom", last_name: "Lo", email: "test@test.com", password: "123456", password_confirmation: "123456")
      expect(User.authenticate_with_credentials("  test@test.com", "123456")).to eql(@user)
      expect(User.authenticate_with_credentials("test@test.com  ", "123456")).to eql(@user)
      expect(User.authenticate_with_credentials("  test@test.com  ", "123456")).to eql(@user)
    end

    it "should return correct user even if some email has different capitalization" do
      @user = User.create(first_name: "Tom", last_name: "Lo", email: "test@test.com", password: "123456", password_confirmation: "123456")
      expect(User.authenticate_with_credentials("TeSt@TeSt.CoM", "123456")).to eql(@user)
    end
  end
end
