class AuthenticationsController < ApplicationController
  before_filter

  def index
    @authentications = current_user.try(:authentications)
  end

  def create
    redirect_to new_user_path unless current_user
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

    if authentication
      login(authentication.user)
      flash[:notice] = I18n.t('controller.authentication.login.successful', :username => current_user.username)
      redirect_to subreddits_path
    elsif current_user
      current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = 'Authentication successful.'
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = 'Signed in successfully.'
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to authentications_url
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = 'Successfully destroyed authentication.'
    redirect_to authentications_url
  end
end
