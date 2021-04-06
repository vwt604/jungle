require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid when given a first name, last name, email, and password matching with confirmation' do
      user = User.create(email: 'joe@doe.com', first_name: 'Joe', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it "should not be valid without an email" do
      user = User.create(first_name: 'Joe', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      expect(user).to_not(be_valid)
      expect(user.errors.full_messages).to(include("Email can't be blank"))
    end

    it "should not be valid without a first name" do
      user = User.create(email: 'joe@doe.com', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      expect(user).to_not(be_valid)
      expect(user.errors.full_messages).to(include("First name can't be blank"))
    end

    it "should not be valid without a last name" do
      user = User.create(email: 'joe@doe.com', first_name: 'Joe', password: 'password', password_confirmation: 'password')
      expect(user).to_not(be_valid)
      expect(user.errors.full_messages).to(include("Last name can't be blank"))
    end

    it 'should have a password with minimum 8 characters in length' do
      user = User.create(email: 'joe@doe.com', first_name: 'Joe', last_name: 'Doe', password: 'p', password_confirmation: 'p')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    it 'should not be valid if email already exists' do
      user1 = User.create(email: 'joe@doe.com', first_name: 'Joe', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      user2 = User.create(email: 'joe@doe.com', first_name: 'Joe', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      user3 = User.create(email: 'JOE@DOE.com', first_name: 'Joe', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")

      expect(user3).to_not be_valid
      expect(user3.errors.full_messages).to include("Email has already been taken")
    end  

  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate user credentials' do
      user = User.create(email: 'joe@doe.com', first_name: 'Joe', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      user.save
      authentication = User.authenticate_with_credentials('joe@doe.com', 'password')
      expect(authentication).to eq(user)
    end
  end
end
