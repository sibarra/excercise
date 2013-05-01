class ProductsController < ApplicationController
  before_filter :find_product, :only => [ :edit, :update, :destroy, :show ]
  before_filter :authenticate_user!, :only => [ :new, :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new params[:product]

    if @product.save
      redirect_to product_path ( @product )
    else
      render :new
    end
  end

  def update
    if @product.update_attributes params[ :product ]
      redirect_to product_path ( @product )
    else
      render :edit
    end
  end

  private
  def find_product
    @product = Product.find params[:id]
  end
end
