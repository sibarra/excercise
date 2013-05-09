require 'spec_helper'

describe SubcategoriesController do
  let( :user ) { FactoryGirl.create :user }
  let( :category) { FactoryGirl.create :category }
  let( :subcategory) { FactoryGirl.create :subcategory }

  describe 'not signed in' do
    it 'must display 404' do
      get :index, :category_id => category.id
      response.status.should eql( 404 )
      response.should render_template( file: 'public/404' )
    end
  end

  describe 'signed in' do
    before { session[:user_id] = user.id }

    describe 'index' do
      it 'should display index template with a valid category' do
        get :index, :category_id => category.id
        response.status.should eql( 200 )
        response.should render_template( :index )
      end

      it 'should render 404 when a category is not valid' do
        get :index, :category_id => 100
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end
    end

    describe 'new' do
      it 'should render 404 when a category is not valid' do
        get :index, :category_id => 100
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end

      it 'should create a new subcategory' do
        post :create, :category_id => category.id, subcategory: FactoryGirl.attributes_for( :subcategory, :category_id => category.id )
        new_subcategory = assigns :subcategory
        response.should redirect_to category_subcategory_path( category.id, new_subcategory )
      end

      it 'should render new if theres an error' do
        post :create, :category_id => category.id, subcategory: FactoryGirl.attributes_for( :subcategory, :category_id => category.id, :name => nil )
        response.should render_template( :new )
      end
    end

    describe 'with existing category' do
      it 'should render edit template' do
        get :edit, :category_id => subcategory.category, :id => subcategory
        response.status.should eql( 200 )
        response.should render_template( :edit )
      end

      it 'should render 404 when a category is not valid' do
        get :edit, :category_id => 100, :id => subcategory
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end

      it 'updates and redirects to the subcategory' do
        put :update, :category_id => subcategory.category, :id => subcategory.id, subcategory: { :name => "NEWNAME" }
        response.status.should eql( 302 )
        response.should redirect_to category_subcategory_path( subcategory.category, subcategory )
        subcategory.reload.name.should eql( "NEWNAME" )
      end
    end
  end
end
