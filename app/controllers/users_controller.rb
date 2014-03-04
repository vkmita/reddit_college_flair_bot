class UsersController < ApplicationController
  before_filter :login_user, :only => :create
  before_filter :record_authentication, :only => :create

  def create
    redirect_to "/r/new?#{{:subreddits_moderated => current_user.subreddits_moderated,:subreddits_subscribed => current_user.subreddits_subscribed}.to_param}"
  end

  private

  def omniauth_hash
    @omniauth_hash ||= request.env.delete('omniauth.auth')
  end

  def record_authentication
    Authentication.create!({ :provider => params[:provider], :uid => params[:code] })
  end

  def login_user
    Rails.logger.info("Logging in user with omniauth hash:\n#{omniauth_hash}")
    login(User.initialize_by_omniauth_hash(omniauth_hash))
  end
end
