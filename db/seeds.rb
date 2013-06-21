agent = Mechanize.new

search_items = ['Barcelona, Spain',
	              'Madrid, Spain',
	              'Tel-Aviv, Israel',
	              'Jerusalem, Israel',
	              'London, United Kingdom',
	              'Paris, France',
	              'Berlin, Germany',
	              'Rome, Italy',
	              'Athens, Greece',
	              'New York, USA',
	              'San Francisco, USA',
	              'Los Angeles, USA',
	              'Miama, USA',
	              'Orlando, USA',
	              'Lima, Peru',
	              'Buenos Aires, Argentina',
	              'Cancun, Mexico',
	              'Rio de Janeiro, Brazil']

search_items.each do |search_item|

	homepage = agent.get('http://www.jetsetter.com')
	search_form = homepage.forms.slice(1)
	search_form['q'] = search_item
	@destination_page = agent.submit(search_form)


	def image_url_list
		images = []
		@destination_page.search('.first img').each do |img|
			img_url = img.attributes['data-src'].value
			img_url.slice!(0..1)
		  images << img_url
		end
		images
	end
  # unless @destination_page
		@destination_page.search('.info').each_with_index do |list, index|
			images = image_url_list
			hotel = Hotel.find_or_create_by_name(name: list.children[1].children.children.text,
				                          location: search_item,
				                          description: list.children.children.children[2].text,
				                          image_url: images[index])
		end
	# end
end
