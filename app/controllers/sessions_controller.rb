class SessionsController < ApplicationController

  before_filter :record_authentication, :only => :create

  def create
    user = User.initialize_by_omniauth_hash(omniauth_hash)
    login(user)
    render
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  private

  def omniauth_hash
    @omniauth_hash ||= request.env['omniauth.auth']
  end

  def record_authentication
    Authentication.create!({ :provider => params[:provider], :uid => params[:code] })
  end
end
