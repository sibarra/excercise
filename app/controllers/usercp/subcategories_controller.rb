class Usercp::SubcategoriesController < ApplicationController
  before_filter :authenticate_user!, :find_category
  before_filter :find_subcategory, :only => [:edit, :update, :destroy, :show]

  def index
    @subcategories = @category.subcategories.all
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new params[:subcategory]

    if @subcategory.save
      redirect_to usercp_category_subcategory_path( @subcategory.category.id, @subcategory )
    else
      render :new
    end
  end

  def update
    if @subcategory.update_attributes( params[:subcategory] )
      redirect_to usercp_category_subcategory_path( @subcategory.category.id, @subcategory )
    else
      render :edit
    end
  end

  private
  def find_category
    @category = Category.find(params[:category_id])
    rescue ActiveRecord::RecordNotFound
      render file: 'public/404', format: :html, status: :not_found
  end

  def find_subcategory
    @subcategory = @category.subcategories.find( params[ :id ] )
    rescue ActiveRecord::RecordNotFound
      render file: 'public/404', format: :html, status: :not_found
  end
end
