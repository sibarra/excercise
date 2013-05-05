require 'spec_helper'

describe CategoriesController do
  let(:user) { FactoryGirl.create :user }
  let(:category) { FactoryGirl.create :category }

  describe 'not logged in' do
    describe 'index' do
      it 'should render 404' do
        get :index
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end
    end

    describe 'edit' do
      it 'should render 404' do
        get :edit, id: category
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end
    end

    describe 'show' do
      it 'should render 404' do
        get :show, id: category
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end
    end
  end

  describe 'logged in' do
    before { session[:user_id] = user.id }

    describe 'new' do
      it 'should allow to access page' do
        get :new
        response.status.should eql( 200 )
        response.should render_template( :new )
      end
    end

    describe 'create a new category' do
      it 'should allow to create category and redirect to it' do
        post :create, category: FactoryGirl.attributes_for( :category )
        response.should redirect_to category_path( assigns( :category ) )
      end

      it 'should render new if it fails' do
        post :create, category: FactoryGirl.attributes_for( :category, :name => nil )
        response.should render_template( :new )
      end
    end

    describe 'with existing category' do
      it 'should render edit template' do
        get :edit, id: category
        response.status.should eql( 200 )
        response.should render_template( :edit )
      end

      it 'should update category and redirect to it' do
        put :update, id: category, category: { name: 'New Category Name' }
        response.should redirect_to category_path( category )
        category.reload.name.should eql( 'New Category Name' )
      end

    end
  end
end
