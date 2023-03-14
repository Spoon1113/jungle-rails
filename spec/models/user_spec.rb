require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'must be created with a password and password_confirmation fields' do
      @user = User.create(
        first_name: "Samson",
        last_name: "Poon",
        email: "Test@test.com",
        password: "12345",
        password_confirmation: "12345"
      )

      expect(@user).to be_valid
    end

    it 'should fail if password and password_confirmation fields are different' do
      @user = User.create(
        first_name: "Samson",
        last_name: "Poon",
        email: "Test@test.com",
        password: "123",
        password_confirmation: "wrong"
      )

      expect(@user).not_to be_valid
    end

    it 'should fail if first name is not set' do
      @user = User.create(
        first_name: nil,
        last_name: "Poon",
        email: "Test@test.com",
        password: "123",
        password_confirmation: "123"
      )

      expect(@user).not_to be_valid
    end

    it 'should fail if last name is not set' do
      @user = User.create(
        first_name: "Samson",
        last_name: nil,
        email: "Test@test.com",
        password: "123",
        password_confirmation: "123"
      )

      expect(@user).not_to be_valid
    end

    it 'should fail if email is not set' do
      @user = User.create(
        first_name: "Samson",
        last_name: "Poon",
        email: nil,
        password: "123",
        password_confirmation: "123"
      )

      expect(@user).not_to be_valid
    end

    it 'makes sure emails are unique and not case-sensitive' do
      @user1 = User.create(
        first_name: "Samson",
        last_name: "Poon",
        email: "TEST@TEST.COM",
        password: "123",
        password_confirmation: "123"
      )
      @user2 = User.create(
        first_name: "Samson",
        last_name: "Poon",
        email: "tEsT@test.com",
        password: "123",
        password_confirmation: "123"
      )

      expect(@user2).not_to be_valid
    end

    it 'should fail if password is less than 5 characters' do
      @user = User.create(
        first_name: "Samson",
        last_name: "Poon",
        email: "test@test.com",
        password: "123",
        password_confirmation: "123"
      )

      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should successfully authenticate user when passwords match' do
      @user = User.create(
        first_name: "Samson", 
        last_name: "Poon",
        email: "test@test.com",
        password: "12345",
        password_confirmation: "12345"
      )

      expect(User.authenticate_with_credentials("test@test.com", "12345")).not_to be(nil)
    end

    it 'should still authenticate with whitespace' do
      @user = User.create(
        first_name: "Samson",
        last_name: "Poon",
        email: "test@test.com",
        password: "12345",
        password_confirmation: "12345"
      )
    
      expect(User.authenticate_with_credentials("   test@test.com     ", "12345")).not_to be(nil)
    end

    it 'should still authenticate with wrong cases in email' do
      @user = User.create(
        first_name: "Samson",
        last_name: "Poon",
        email: "test@test.com",
        password: "12345",
        password_confirmation: "12345"
      )
      expect(User.authenticate_with_credentials("TEst@teSt.COM", "12345")).not_to be(nil)
    end
  end
end
