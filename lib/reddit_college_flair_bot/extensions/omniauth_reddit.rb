OmniAuth::Strategies::Reddit.class_eval do
  extra do
    {
        'username' => raw_info['name'],
        'subreddits' => { 'subscriber' => subscriber_subreddits, 'moderator' => moderator_subreddits }
    }
  end

  def username
    @username ||= raw_info['name']
  end

  def subscriber_subreddits
    @subscriber_subreddits ||= access_token.get('/subreddits/mine/subscriber').parsed || {}
  end

  def moderator_subreddits
    @moderator_subreddits ||= access_token.get('/subreddits/mine/moderator').parsed || {}
  end
end