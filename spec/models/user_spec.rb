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

    it('should be not be valid with a short password') do
      user = User.new password: 'shor', password_confirmation: 'shor'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Password is too short (minimum is 5 characters"')')
    end

    it ('should be invalid without a first_name entered') do
      user = User.new last_name: 'w', email: 'cj@se.com', password: 'testere', password_confirmation: 'testere'
      user.save
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("First name can't be blank")
    end

    it ('should be invalid without a last_name entered') do
      user = User.new first_name: 'w', email: 'cj@se.com', password: 'testere', password_confirmation: 'testere'
      user.save
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Last name can't be blank")
    end

    it ('should be invalid without an email entered') do
      user = User.new first_name: 'cj', last_name: 'w', password: 'testere', password_confirmation: 'testere'
      user.save
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Email can't be blank")
    end


    it ('should be invalid without a unique email') do
      user = User.new(first_name: 'cj', last_name: 'w', email: 'cj@se.com', password: 'testere', password_confirmation: 'testere')
      user.save
    
      u = User.new(first_name: 'c', last_name: 'j', email: 'cj@se.com', password: 'testere', password_confirmation: 'testere')
      u.save
    
      expect(u.errors.full_messages).to include ('Email has already been taken')
    end

    it ('should be valid with all validations met') do
      user = User.new first_name: 'cj', last_name: 'w', email: 'cj@se.com', password: 'testere', password_confirmation: 'testere'
      expect(user).to be_valid
    end

  end

  describe ('.authenticate_with_credentials') do
    
    it ('should be invalid if user fails login') do
      user = User.create! first_name: 'cj', last_name: 'w', email: 'cj@se.com', password: 'testere', password_confirmation: 'testere'
      expect(User.authenticate_with_credentials('cj@se.com', 'toaster')).to be nil
      expect(user.errors.full_messages)
    end
  end
end
