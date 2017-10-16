require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it ('should be invalid without a name') do
      product = Product.new
      expect(product).to_not be_valid
      expect(product.errors.messages[:name]).to include('can\'t be blank')
    end
    
    it ('should be invalid without a price') do
      product = Product.new
      expect(product).to_not be_valid
      expect(product.errors.messages[:price]).to include('can\'t be blank')
    end

    it ('should be invalid without a quantity') do
      product = Product.new
      expect(product).to_not be_valid
      expect(product.errors.messages[:quantity]).to include('can\'t be blank')
    end

    it ('should be invalid without a category') do
      product = Product.new
      expect(product).to_not be_valid
      expect(product.errors.messages[:category]).to include('can\'t be blank')
    end
      
    it ('should be valid with all validations met') do
        category = Category.new(name: 'Test')
        product = Product.new(name: 'CJ', price: 15, quantity: 5, category: category)
        expect(product).to be_valid
        expect(product.errors.messages)
    end
  end
end