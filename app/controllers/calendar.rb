get '/calendar' do
	@hotel = Hotel.all
	erb :calendar
end