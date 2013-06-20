helpers do

  def oauth_client
    @client ||= OAuth2::Client.new(
      ENV['GOOGLE_ID'],
      ENV['GOOGLE_SECRET'],
      :site => 'https://accounts.google.com',
      :token_url => '/o/oauth2/token',
      :authorize_url => '/o/oauth2/auth'
    )
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end