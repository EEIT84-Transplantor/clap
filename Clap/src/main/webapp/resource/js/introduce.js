//滾輪平滑
$(function() {
	var h = $(window).height();
	console.log(h);
	$(window).on("mousewheel", function(event) {
		TweenMax.to(window, 2, { scrollTo : { y : "-=" + event.deltaY * h/5  }, ease : Power3.easeOut });
	});
});