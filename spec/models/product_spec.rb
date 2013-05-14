require 'spec_helper'

describe Product do
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

  describe "image" do
    it "should allow png files" do
      product.image = File.new( Rails.root + 'spec/images/rails.png' )
      product.should be_valid
    end

    it "should allow jpg files" do
      product.image = File.new( Rails.root + 'spec/images/dress.jpg' )
      product.should be_valid
    end

    it 'should not allow other files' do
      product.image = File.new( Rails.root + 'spec/images/test.txt' )
      product.should be_invalid
    end

    it 'should allow files smaller than 5 MBs' do
      should validate_attachment_size(:image).less_than(5.megabytes)
    end

    it 'cant allow files larger than 5 MBs' do
      should_not validate_attachment_size(:image).greater_than(5.megabytes)
    end
  end
end
