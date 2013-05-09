require 'spec_helper'

describe 'Subcategory' do
  let(:category)    { FactoryGirl.create :category }
  let(:subcategory) { FactoryGirl.create :subcategory }
  before { subcategory.category = category }

  describe 'name' do
    it "can't be nil" do
      subcategory.name = nil
      subcategory.should be_invalid
    end
  end

  describe 'category_id' do
    it 'must have a category_id' do
      subcategory.category_id = nil
      subcategory.should be_invalid
    end

    it 'must have an existing category_id' do
      subcategory.category_id = 100
      subcategory.should be_invalid
    end

    it 'is valid with an existing category' do
      subcategory.should be_valid
    end
  end
end
