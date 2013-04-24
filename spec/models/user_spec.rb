require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build :user }

  describe 'first_name' do
    it "can't be blank" do
      user.first_name = ''
      user.should be_invalid
    end

    it "can't be nil" do
      user.first_name = nil
      user.should be_invalid
    end
  end

  describe 'last_name' do
    it "can't be blank" do
      user.last_name = ''
      user.should be_invalid
    end

    it "can't be nil" do
      user.last_name = nil
      user.should be_invalid
    end
  end

  describe 'email' do
    it "can't be blank" do
      user.email = ''
      user.should be_invalid
    end

    it "can't be duplicate" do
      user.email = 'a@b.com'
      user.save
      user2 = FactoryGirl.build :user, :email => 'a@b.com'
      user2.should be_invalid
    end
  end

  describe 'password' do
    it "can't be blank" do
      user.password = ''
      user.should be_invalid
    end

    it "can't be shorter than 6 characters" do
      user.password = '12345'
      user.should be_invalid
    end

    it "can't be longer than 20 characters" do
      user.password = '1234567890123456789012345'
      user.should be_invalid
    end

    it "can be between 6 and 20 characters long" do
      user.password = '12345678'
      user.should be_valid
    end
  end
end
