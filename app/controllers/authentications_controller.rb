
class AuthenticationsController < ApplicationController
  def create
      @authentication = Authentication.new({ :provider => params[:provider], :uid => params[:code] })
    @authentication.save!

    debugger

    render 'subreddits/index'
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = 'Successfully destroyed authentication.'
    redirect_to authentications_url
  end

  private


  # request.env['omniauth.auth'].info.subscriber.data.children.map {|c| c.data.display_name}
  # request.env['omniauth.auth'].info.moderator.data.children.map {|c| c.data.display_name}
end
