//滾輪平滑
$(function() {
	var h = $(window).height();
	$(window).on("mousewheel", function(event) {
		TweenMax.to(window, 1, { scrollTo : { y : "-=" + event.deltaY * h/4  }, ease : Power3.easeOut });
	});
	
	$("path").each(function(){
		var lineLength=this.getTotalLength();
		$(this).css("stroke-dasharray", lineLength);
		$(this).css("stroke-dashoffset", lineLength);
	})
});