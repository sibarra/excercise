class ProfileController < ApplicationController
  before_filter :find_user, only: [ :edit, :update, :destroy ]

  def index
    @user = User.find(1)
  end

  def update
    if @user.update_attributes params[:user]
      redirect_to profile_index_path
    else
      render :edit
    end
  end

  private
  def find_user
    @user = User.find params[:id]
  end
end
