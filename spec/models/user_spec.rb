require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
    it ('should be invalid without a password entered') do
      user = User.new password: nil, password_confirmation: nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ('Password can\'t be blank')
    end

    it ('should be invalid with a confirmation mismatch') do
      user = User.new password: 'Testere', password_confirmation: 'Tester'
      expect(user).to_not be_valid
    end

    it ('should be valid with confirmation match') do
      user = User.new password: 'testere', password_confirmation: 'testere'
      expect(user).to be_valid
    end

    it('should be not be valid with a short password') do
      user = User.new password: 'shor', password_confirmation: 'shor'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Password is too short (minimum is 5 characters"')')
    end

    it ('should be invalid without a unique email') do
      user = User.new(email: 'bugs', password: '12345')
      user.save
    
      u = User.new(email: 'buGs', password: '12345')
      u.save
    
      expect(u.errors.full_messages).to include ('Email has already been taken')
    end

  end
end
