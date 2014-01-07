require 'snoo'

module Reddit
  class Client
    attr_reader :user, :client

    def initialize(user)
      @user = user
      @client = Snoo::Client.new
    end

    def log_in
      client.log_in(user.username, user.password)
    end
  end
end
