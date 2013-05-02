require 'spec_helper'

describe ProductsController do
  let(:user) { FactoryGirl.create :user }
  let(:product) { FactoryGirl.create :product }

  describe 'not logged in' do
    describe 'new' do
      it 'should display 404' do
        get :new
        response.status.should eql( 404 )
        response.should render_template( file: 'public/404' )
      end
    end

    describe 'create' do
      it 'should not be able to create products' do
        post :create, product: FactoryGirl.attributes_for( :product )
        response.status.should eql( 302 )
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

    describe 'create a new product' do
      it 'should allow to create new products' do
        post :create, product: FactoryGirl.attributes_for( :product )
        response.should redirect_to product_path( assigns( :product ) )
      end

      it 'should render new if it fails' do
        post :create, product: FactoryGirl.attributes_for( :product, :name => nil )
        response.should render_template( :new )
      end
    end

    describe 'with existing product' do
      it 'should render edit' do
        get :edit, id: product
        response.status.should eql(200)
        response.should render_template( :edit )
      end

      it 'should update and redirect' do
        put :update, id: product, product: { name: 'Updated name' }
        response.should redirect_to( product_path( product ) )
        product.reload.name.should eql('Updated name')
      end
    end
  end
end
