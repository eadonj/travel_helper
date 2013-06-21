$(document).ready(function() {
   
   function makeDraggable(elements){
		$(elements).draggable({
			helper: 'clone',
			start: function(event, ui){
				$(ui.helper).addClass("picked_up");
			},
			grid: [20,20],
			opacity: 0.7,
			zIndex: 2
		});
	}

	makeDraggable(".hotels")

  function checkDuplication(element, column){
  	var duplicate = false;
  	var hotelName = $(element).find('.name').text();
  	var hotels = $(column).find('div');
  	
  	for (var i = 0; i < hotels.length; i++){
  		name = $(hotels[i]).find('.name').text();
  		if (name === hotelName){
  			return duplicate = true;
  		}
  	}
  	return duplicate;
  }

	$(".column").droppable({
		accept: '.hotels',
		drop: function(event, ui) {
			var element = ui.draggable.clone();
			duplicate = checkDuplication(element, this);
			console.log(duplicate);
			if (duplicate === false) {
	      $(element).addClass("dropped");
				makeDraggable(element);
				$(this).append(element);
				console.log(element);
			}
		}
	});


  $("#search").submit(function(e){
    e.preventDefault();
    console.log("i'm here");
    $.ajax({
    	url: '/calendar',
    	action: '/post',
    	data: $(this).serialize()
    });
  })


});
