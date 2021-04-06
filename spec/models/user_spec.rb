require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid when all fields are rentered correctly' do
      user = User.new(email: 'test@example.com', first_name: 'Joe', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'should be invalid if email is missing' do
      user = User.new(first_name: 'Joe', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
      expect(product.errors[:name]).to(include("can't be blank"))
    end
  end  

end
