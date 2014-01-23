class AuthenticationsController < ApplicationController

  def create
    authentication = Authentication.new({ :provider => omniauth_provider, :uid => omniauth_uid })

    flash[:notice] = I18n.t('controller.authentication.login.successful', :username => current_user.username)
    render 'users/new'

    if authentication
      login(authentication.user)

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

  private

  def omniauth_provider
    request.env['omniauth.auth']['provider']
  end

  def omniauth_uid
    request.env['omniauth.auth']['provider']
  end
end
