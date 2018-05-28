require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is not valid without a name" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      name_fail = cat1.products.create({
        name:  nil,
        description: 'test',
        quantity: 4,
        price: 34.49
      })
      expect(name_fail).to_not be_valid
    end
    it "is not valid without a price" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      price_fail = cat1.products.create({
        name:  'Hipster Hat',
        description: 'test',
        quantity: 4,
      })
      expect(price_fail).to_not be_valid
    end
    it "is not valid without a set quantity" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      quantity_fail = cat1.products.create({
        name:  'Hipster Hat',
        description: 'test',
        price: 34.49
      })
      expect(quantity_fail).to_not be_valid
    end
    it "is not valid without a category" do
      category_fail = Product.create({
        name:  'Hipster Hat',
        description: 'test',
        quantity: 4,
        price: 34.49,
        category_id: nil
      })
      expect(category_fail).to_not be_valid
    end
    it "has an error message" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      name_fail = cat1.products.create({
        name:  nil,
        description: 'test',
        quantity: 4,
        price: 34.49
      })
      expect(name_fail.errors.full_messages).to eq(["Name can't be blank"])
    end
  end
end
