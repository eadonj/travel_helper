get '/calendar/:location' do
  p params[:location]
	@hotels = Hotel.all
  p @hotels
	erb :calendar
end

post '/calendar' do
  p params[:destination]
  find_hotels(params[:destination])
end
