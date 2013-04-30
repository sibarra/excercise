class SessionsController < ApplicationController
  def new
  end

  def create
    t = params[:user]
    user = User.authenticate(t[:email], t[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => I18n.t('static_pages.logged_in')
    else
      flash.notice = I18n.t('static_pages.invalid_login')
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => I18n.t('static_pages.logged_out')
  end
end
