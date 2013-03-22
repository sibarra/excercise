class HomeController < ApplicationController
  def index

  end

  def register
    @user = User.new
  end

  def create
    @user = users.build params[:user]

    if @user.save

    else
      render :register
    end
  end

  def show

  end
end
