get '/calendar' do
	@hotel = Hotel.all
	erb :calendar
end

post '/calendar' do
  p params[:destination]
end
