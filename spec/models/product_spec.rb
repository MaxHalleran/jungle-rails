require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    subject {
      cat1 = Category.new(name: "Testing Category")
      prod1 = cat1.products.new(name: "Anything", price: 10, quantity:10)
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a category_id" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

  end

end
