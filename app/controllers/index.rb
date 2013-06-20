get '/' do
  @url = oauth_client.auth_code.authorize_url(:scope => 'openid email profile https://www.googleapis.com/auth/calendar', :redirect_uri => 'http://localhost:9393/oauth2/callback')
  # @url = oauth.client.auth_code(:scope => 'https://www.googleapis.com/auth/calendar' :redirect_uri => 'htt://localhost:9393/oauth2/callback')
  erb :index
end

get '/oauth2/callback' do
  token = oauth_client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:9393/oauth2/callback')
  response = token.get('https://www.googleapis.com/oauth2/v1/userinfo?alt=json')
  p response
  user_info = JSON.parse(response.body)
  p user_info
  new_user = User.find_or_create_by_name(name: user_info['name'], 
                                   email: user_info["email"], 
                                    photo: user_info["picture"])
  new_user.update_attributes(email: user_info["email"], photo: user_info["picture"])
  session[:user_id] = new_user.id
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end