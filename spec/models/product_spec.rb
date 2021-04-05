require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid when given all four fields' do
      category = Category.new()
      category.save!
      product = Product.new(name: "Funky Hat", price: 10, quantity: 10, category_id: category.id)
      expect(product).to be_valid
    end

  end
end
