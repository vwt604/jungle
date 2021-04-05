require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid when given all four fields' do
      category = Category.new()
      category.save!
      product = Product.new(name: "Funky Hat", price: 10, quantity: 10, category_id: category.id)
      expect(product).to be_valid
    end

    it 'should be invalid if name is missing' do
      category = Category.new()
      category.save!
      product = Product.new(price: 10, quantity: 10, category_id: category.id)
      expect(product).to_not be_valid
      expect(product.errors[:name]).to(include("can't be blank"))
    end

    it 'should be invalid if price is missing' do
      category = Category.new()
      category.save!
      product = Product.new(name: "Funky Hat", quantity: 10, category_id: category.id)
      expect(product).to_not be_valid
      expect(product.errors[:price]).to(include("can't be blank"))
    end

    it 'should be invalid if quantity is missing' do
      category = Category.new()
      category.save!
      product = Product.new(name: "Funky Hat", price: 10, category_id: category.id)
      expect(product).to_not be_valid
      expect(product.errors[:quantity]).to(include("can't be blank"))
    end

  end
end
