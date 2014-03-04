module SubredditsHelper
  def subreddit_name
    @subreddit_name ||= params[:subreddit_name]
  end

  def subreddits_moderated
    @subreddits_moderated ||= params[:subreddits_moderated]
  end

  def subreddits_subscribed
    @subreddits_subscribed ||= params[:subreddits_subscribed]
  end
end
