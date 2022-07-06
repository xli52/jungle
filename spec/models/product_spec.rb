require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "should not save without a valid name" do
      category = Category.new
      product = Product.new(name: nil, price: 2999, quantity: 123, category: category)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    
    it "should not save without a valid price" do
      category = Category.new
      product = Product.new(name: "New Plant", price: false, quantity: 9119, category: category)
      product.save
      expect(product.errors.full_messages).to include("Price cents is not a number" || "Price is not a number" || "Price can't be blank")
    end
    
    it "should not save without a valid quantity" do
      category = Category.new
      product = Product.new(name: "New Plant", price: 3999, quantity: nil, category: category)
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not save without a valid category" do
      category = Category.new
      product = Product.new(name: "New Plant", price: 2999, quantity: 123, category: nil)
      product.save
      expect(product.errors.full_messages).to include("Category must exist" || "Category can't be blank")
    end

    it "should save if all fields are valid" do
      category = Category.new
      product = Product.new(name: "New Plant", price: 2999, quantity: 123, category: category)
      product.save
      expect(product).to be_valid
    end
  end
end