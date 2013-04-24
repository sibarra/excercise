require 'spec_helper'

describe 'Product' do
  let(:product) { FactoryGirl.create :product }

  describe "code" do
    it "can be blank" do
      product.code = ''
      product.should be_valid
    end
  end

  describe "name" do
    it "can't be blank" do
      product.name = ''
      product.should be_invalid
    end
  end

  describe "price" do
    it "can't be alphabetic" do
      product.price = 'abc'
      product.should be_invalid
    end

    it "accepts decimal values" do
      product.price = '14.50'
      product.should be_valid
    end

    it "can be zero" do
      product.price = '0'
      product.should be_valid
    end
  end
end