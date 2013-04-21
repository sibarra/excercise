require 'spec_helper'

describe User do

  describe 'first_name' do
    it "can't be blank" do
      user = FactoryGirl.build :user, :first_name => ''
      user.should be_invalid
    end
  end
end
