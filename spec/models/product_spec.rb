require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    #validation tests/examples here
    it 'should save when all 4 fields are set succesfully' do
      @category = Category.new
      @product = Product.create(
        name: 'Tesla',
        price: 20000,
        quantity: 1,
        category: @category
      )

      expect(@product).to be_valid
    end

    it 'should fail if name is not set' do
      @category = Category.new
      @product = Product.create(
        name: nil,
        price: 15000,
        quantity: 5,
        category: @category
      )

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should fail if price is not set' do
      @category = Category.new
      @product = Product.create(
        name: 'Iphone',
        quantity: 100,
        category: @category
      )
      
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it 'should fail if quantity is not set' do
      @category = Category.new
      @product = Product.create(
        name: 'Galaxy',
        price: 500,
        quantity: nil,
        category: @category
      )

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should fail if category is not set' do
      @cateogry = Category.new
      @product = Product.create(
        name: 'Honda',
        price: 50000,
        quantity: 20,
        category: nil
      )

      expect(@product.errors.full_messages).to include("Category must exist")
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
