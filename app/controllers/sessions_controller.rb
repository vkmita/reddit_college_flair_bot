class SessionsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class SessionsController < ApplicationController
    def create
      @user = User.find_or_create_from_auth_hash(auth_hash)
      self.current_user = @user
      redirect_to '/'
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end
  end

end
