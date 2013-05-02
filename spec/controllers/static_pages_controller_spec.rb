require 'spec_helper'

describe StaticPagesController do
  let( :user ) { FactoryGirl.create :user }

  describe 'not signed in' do
    describe 'sign in page' do
      it 'should display sign in page' do
        get :signin
        response.status.should eql( 200 )
        response.should render_template( :signin )
      end
    end
  end

  describe 'signed in' do
    before { session[:user_id] = user.id }
    describe 'sign in page' do
      it 'should redirect to index' do
        get :signin
        response.status.should eql( 302 )
        response.should redirect_to( root_path )
      end
    end
  end
end
