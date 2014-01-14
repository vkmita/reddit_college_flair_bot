require 'snoo'

module Reddit
  class Client
    attr_reader :user, :client, :log_in_response

    def initialize(user)
      @user = user
    end

    def client
      @client ||= Snoo::Client.new
    end

    def log_in
      @log_in_response = client.log_in(user.username, user.password)
    end

    def logged_in?
      log_in_response.code == 200
    end
  end
end
