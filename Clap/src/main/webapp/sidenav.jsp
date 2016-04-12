<div id="sideMenu">
  <div class="list-group panel">
    <a href="#side_Purchase" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Purchase</a>
   <div class="collapse" id="side_Purchase">
      <a href="" class="list-group-item sub_list">Subitem 1</a>
      <a href="" class="list-group-item sub_list">Subitem 2</a>
      <a href="" class="list-group-item sub_list">Subitem 3</a>
    </div>
    <a href="#side_About" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">About us</a>
    <div class="collapse" id="side_About">
      <a href="" class="list-group-item sub_list">Concept</a>
      <a href="" class="list-group-item sub_list">Team members</a>
    </div>
     <a href="#side_Simulator" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Simulator</a>
    <div class="collapse" id="side_Simulator">
      <a href="" class="list-group-item sub_list">Simulator1</a>
      <a href="" class="list-group-item sub_list">Simulator2</a>
    </div>
     <a href="#side_Appointment" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Appointment</a>
    <div class="collapse" id="side_Appointment">
      <a href="" class="list-group-item sub_list">Hospital</a>
    </div>
     <a href="#side_Contact" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Contact us</a>
    <div class="collapse" id="side_Contact">
      <a href="" class="list-group-item sub_list">Contact us</a>
    </div>
     <a href="#side_Account" class="list-group-item list-group-item" data-toggle="collapse" data-parent="#sideMenu">Account</a>
    <div class="collapse" id="side_Account">
      <a href="" class="list-group-item sub_list">Setting</a>
      <a href="" class="list-group-item sub_list">Payment</a>
    </div>
  </div>
</div>
<div id="priceFilter">
<p>Filter by price:</p> 

<span id="min_price">$ 60 </span> <input id="p_price" type="text" class="slider" value="" data-slider-min="60" data-slider-max="700" data-slider-step="5" data-slider-value="[60,700]"/> <span id="max_price">$ 700</span>
</div>
	<script type="text/javascript" src="../resource/js/bootstrap-slider.js"></script>
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

