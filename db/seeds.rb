# agent = Mechanize.new

# search_items = ['Barcelona',
# 	              'Madrid',
# 	              'Tel-Aviv',
# 	              'Jerusalem',
# 	              'London',
# 	              'Paris',
# 	              'Berlin',
# 	              'Rome',
# 	              'Athens',
# 	              'New York',
# 	              'San Francisco',
# 	              'Los Angeles',
# 	              'Miama',
# 	              'Orlando',
# 	              'Lima',
# 	              'Buenos Aires',
# 	              'Cancun',
# 	              'Rio de Janeiro']

# search_items.each do |search_item|
#   sleep(120)
# 	homepage = agent.get('http://www.jetsetter.com')
# 	search_form = homepage.forms.slice(1)
# 	search_form['q'] = search_item
# 	@destination_page = agent.submit(search_form)


# 	def image_url_list
# 		images = []
# 		@destination_page.search('.first img').each do |img|
# 			img_url = img.attributes['data-src'].value
# 			img_url.slice!(0..1)
# 		  images << img_url
# 		end
# 		images
# 	end
#   # unless @destination_page
# 		@destination_page.search('.info').each_with_index do |list, index|
# 			images = image_url_list
# 			hotel = Hotel.find_or_create_by_name(name: list.children[1].children.children.text,
# 				                          location: search_item,
# 				                          description: list.children.children.children[2].text,
# 				                          image_url: images[index])
# 		end
# 	# end
# end
