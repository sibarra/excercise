class StaticPagesController < ApplicationController
  def index

  end

  def join
    redirect_to root_path if current_user
    @user = User.new
  end

  def register
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render :join
    end
  end

  def signin
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def signout
  end
end
