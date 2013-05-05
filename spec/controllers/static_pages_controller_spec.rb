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

    describe 'join process' do
      it 'should render join template' do
        get :join
        response.status.should eql( 200 )
        response.should render_template( :join )
      end

      it 'should create new user and redirect' do
        put :register, user: FactoryGirl.attributes_for( :user )
        response.status.should eql( 302 )
        response.should redirect_to( root_path )
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

    describe 'join page' do
      it 'should not be able to register again' do
        get :join
        response.status.should eql ( 302 )
        response.should redirect_to( root_path )
      end
    end
  end
end
