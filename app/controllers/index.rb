get '/' do
  @url = oauth_client.auth_code.authorize_url(:scope => 'openid email profile https://www.googleapis.com/auth/calendar', :redirect_uri => 'http://localhost:9393/oauth2/callback')
  erb :index
end

get '/users' do
  
end

post '/users' do
end
