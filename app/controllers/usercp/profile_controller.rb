class Usercp::ProfileController < ApplicationController
  before_filter :find_user, only: [ :edit, :update, :destroy ]
  before_filter :authenticate_user!

  def index
    @user = current_user
  end

  def update
    if @user.update_attributes params[:user]
      redirect_to usercp_profile_index_path
    else
      render :edit
    end
  end

  private
  def find_user
    @user = User.find params[:id]
  end
end
