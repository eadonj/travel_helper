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


$(document).ready(function() {
   
   function makeDraggable(elements){
		$(elements).draggable({
			helper: 'clone',
			start: function(event, ui){
				$(ui.helper).addClass("picked_up");
				$(ui.helper).css("margin-right", event.clientX - $(event.target).offset().left);
        $(ui.helper).css("margin-top", event.clientY - $(event.target).offset().top);
			},
			grid: [20,20],
			opacity: 0.7,
			zIndex: 2
		});
	}

	makeDraggable(".hotels")

	$(".column").droppable({
		accept: '.hotels',
		hoverClass: 'hover_column',
		drop: function(event, ui) {
			var element = ui.draggable.clone(),
			duplicate = checkDuplication(element, this);
			if (duplicate === false) {
	      $(element).addClass("dropped");
				makeDraggable(element);
				$(this).append(element);
			}
		}
	});

  $("#search").submit(function(e){
    e.preventDefault();
    $('#search_bar').val('');
    $.ajax({
    	url: '/calendar',
    	method: 'POST',
    	data: $(this).serialize()
    });
  })
});
