class StaticPagesController < ApplicationController
  def index

  end

  def join
    @user = User.new
  end

  def register
    @user = User.new(params[:user])

    if @user.save
      render :index
    else
      @errors = @user.errors.full_messages
      render :register
    end
  end

  def show

  end
end
