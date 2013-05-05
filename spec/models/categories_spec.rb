require 'spec_helper'

describe 'Category' do
  let(:category) { FactoryGirl.create :category }

  describe 'name' do
    it "can't be empty" do
      category.name = ''
      category.should be_invalid
    end
  end
end
