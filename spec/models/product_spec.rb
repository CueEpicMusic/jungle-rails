require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should be valid if all fields are filled in" do
      @category = Category.new(name: "Tree")
      @product = Product.new(name: "Maple", price: 10, quantity: 5, category: @category)
      expect(@product).to be_valid
    end

    it "should have name" do
      @category = Category.new(name: "Tree")
      @product = Product.new(name: nil, price: 10, quantity: 5, category: @category)
      expect(@product).to_not be_valid
      p @product.errors.full_messages
    end

    it "should have price" do
      @category = Category.new(name: "Tree")
      @product = Product.new(name: "Maple", price: "", quantity: 5, category: @category)
      expect(@product).to_not be_valid
      p @product.errors.full_messages
    end
    
    it "should have quantity" do
      @category = Category.new(name: "Tree")
      @product = Product.new(name: "Maple", price: 10, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      p @product.errors.full_messages
    end

    it "should have category" do
      @category = Category.new(name: "Tree")
      @product = Product.new(name: "Maple", price: 10, quantity: 5, category: nil)
      expect(@product).to_not be_valid
      p @product.errors.full_messages
    end
  end
end