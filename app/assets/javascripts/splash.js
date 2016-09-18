$(document).on('ready', function(event){
	console.log('yooo')
	window.sp = ScrollReveal({ reset: true });
	sp.reveal('.s1', { duration: 750, delay: 300, origin: 'top' });
	sp.reveal('.s2', { duration: 750, delay: 600, origin: 'top' });
	sp.reveal('.s3', { duration: 750, delay: 900, origin: 'top' });
	sp.reveal('.s4', { duration: 750, delay: 1200, origin: 'top' });
	sp.reveal('.s5', { duration: 750, delay: 1500, origin: 'top' });
	sp.reveal('.s6', { duration: 750, delay: 1800, origin: 'top' });
	sp.reveal('.s7', { duration: 750, delay: 2100, origin: 'top' });
});