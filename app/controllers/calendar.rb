get '/calendar' do
	@hotel = Hotel.all
	erb :calendar
end

post '/calendar' do
  p "i'm here too"
  p params[:destination]
  find_hotels(params[:destination])
end
