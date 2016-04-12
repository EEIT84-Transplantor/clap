<div id="categoryMenu">
  <div class="list-group panel">
    <a href="#demo1" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#categoryMenu">Item 1</a>
   <div class="collapse" id="demo1">
      <a href="" class="list-group-item sub_list">Subitem 1</a>
      <a href="" class="list-group-item sub_list">Subitem 2</a>
      <a href="" class="list-group-item sub_list">Subitem 3</a>
    </div>
    <a href="#demo2" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#categoryMenu">Item 2</a>
    <div class="collapse" id="demo2">
      <a href="" class="list-group-item sub_list">Subitem 1</a>
      <a href="" class="list-group-item sub_list">Subitem 2</a>
      <a href="" class="list-group-item sub_list">Subitem 3</a>
    </div>
  </div>
</div>
<div id="priceFilter">
<p>Filter by price:</p> 

<span id="min_price">$ 60 </span> <input id="p_price" type="text" class="slider" value="" data-slider-min="60" data-slider-max="700" data-slider-step="5" data-slider-value="[60,700]"/> <span id="max_price">$ 700</span>
</div>

	<script type="text/javascript" src="<c:url value="/resource/js/bootstrap-slider.js"/>"></script>
<script type="text/javascript">
var slider = new Slider('#p_price', {});

slider.on('slide', function (ev) {
    var pricerange = $('#p_price').val().split(",");
    var min = pricerange[0];
    var max = pricerange[1];
    document.getElementById("min_price").innerHTML="$"+min;
    document.getElementById("max_price").innerHTML="$"+max;
    //
});



</script>

