$(document).on('ready', function(event) {
	
	$( '#report_button' ).on('click', function() {
		$(document.body).animate({
	    'scrollTop':   $('#anchor1').offset().top
		}, 1000);
	});

	$( '.report_icon' ).on('click', function() {
		$(document.body).animate({
	    'scrollTop':   $('#anchor2').offset().top
		}, 1000);
	});

})
