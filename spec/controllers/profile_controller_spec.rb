require 'spec_helper'

describe ProfileController do
  let( :user ) { FactoryGirl.create :user }

  describe 'not signed in' do
    describe 'index' do
      it 'should render 404' do
        get :index
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end
    end

    describe 'edit' do
      it 'should render 404' do
        get :edit, id: user
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end
    end

    describe 'update' do
      it 'should render 404' do
        put :update, id: user, user: { first_name: "New name" }
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end
    end
  end

  describe 'Signed in' do
    before { session[:user_id] = user.id }

    describe 'index' do
      it 'should render index' do
        get :index
        response.status.should eql ( 200 )
        response.should render_template( :index )
      end
    end

    describe 'edit' do
      before { @pass = user.password }

      it 'should render edit template' do
        get :edit, id: user
        response.status.should eql( 200 )
        response.should render_template( :edit )
      end

      it 'should update and redirect' do
        put :update, id: user, user: { first_name: "New Name" }
        response.should redirect_to( profile_index_path )
        user.reload.first_name.should eql( 'New Name' )
      end

      it 'should not update password' do
        pass = user.password
        put :update, id: user, user: { first_name: 'New Name' }
        response.should redirect_to( profile_index_path )
        user.reload.password.should eql( @pass )
      end
    end
  end
end
