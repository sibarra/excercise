class Usercp::CategoriesController < ApplicationController
  before_filter :find_category, :only => [ :edit, :update, :show, :destroy ]
  before_filter :authenticate_user!
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new( params[:category] )

    if @category.save
      redirect_to usercp_category_path( @category )
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.json { render :json => @category.subcategories }
      format.html
    end
  end

  def update
    if @category.update_attributes params[ :category ]
      redirect_to usercp_category_path( @category )
    else
      render :new
    end
  end

  private
  def find_category
    @category = Category.find( params[:id] )
  end
end
