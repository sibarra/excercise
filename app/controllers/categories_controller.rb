class CategoriesController < ApplicationController
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
      redirect_to category_path( @category )
    else
      render :new
    end
  end

  def show
  end

  def update
    if @category.update_attributes params[ :category ]
      redirect_to category_path( @category )
    else
      render :new
    end
  end

  private
  def find_category
    @category = Category.find( params[:id] )
  end
end
