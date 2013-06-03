class Usercp::ProductsController < ApplicationController
  before_filter :find_product, :only => [ :edit, :update, :destroy, :show ]
  before_filter :authenticate_user!, :only => [ :index, :new, :edit, :update, :destroy, :create ]

  def index
    @products = Product.where("user_id = #{current_user.id}")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new params[:product]
    @product.user = current_user

    if @product.save
      redirect_to usercp_product_path ( @product )
    else
      render :new
    end
  end

  def update
    @product.user = current_user
    if @product.update_attributes params[ :product ]
      redirect_to usercp_product_path ( @product )
    else
      render :edit
    end
  end

  private
  def find_product
    @product = Product.find params[:id]
  end
end
