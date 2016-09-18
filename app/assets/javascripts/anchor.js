$(document).on('ready', function(event) {
	$(".spinner").hide();

	$( '#report_button' ).on('click', function() {
		$(".g-report").hide();
		$(".spinner").show();
		setTimeout(function() { $(".spinner").hide(); }, 1300);
		setTimeout(function() { $(".g-report").show(); }, 1300);

		$(document.body).delay(1400).animate({
	    'scrollTop':   $('#anchor1').offset().top
		}, 1000);

	});

	$( '.report_icon' ).on('click', function() {
		$(document.body).animate({
	    'scrollTop':   $('#anchor2').offset().top
		}, 1000);
	});

})
