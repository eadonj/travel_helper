$(document).ready(function() {

	$(".demo_event").draggable({
		grid: [150,20],
		containment: '.demo_cal',
		opacity: 0.7,
		zIndex: 2
	});

	$(".d_col").droppable({
		accept: '.demo_event',
		drop: function(event, ui) {
			var evtName = ui.draggable.text();
			var evtDay = $(this).attr('title');
		}
   	});

});
