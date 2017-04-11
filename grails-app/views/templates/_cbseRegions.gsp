<section class="content-header">
    <h3>
       <i class="fa fa-map-marker"></i> CBSE regions in India
    </h3>
</section>
          
<section class="content">
	<div class="row">
		<div class="col-lg-3" ></div>
		<div class="col-lg-7" >
			<div id="map-canvas" style="height: 450px; margin: 0 auto"></div>
		</div>
		<div class="col-lg-2" ></div>
	</div>
</section>


       
<script>
	var latLong_Chennai = new google.maps.LatLng(13.0475604,80.2089535);
	var latLong_Ajmer = new google.maps.LatLng(26.4418559,74.6470374);
	var latLong_Guwahati = new google.maps.LatLng(26.1430486,91.7028829);
	var latLong_Panchkula = new google.maps.LatLng(30.6973958,76.8642764);
	var latLong_Allahabad = new google.maps.LatLng(25.4022637,81.8015845);
	var latLong_Bhubaneswar = new google.maps.LatLng(20.3008841,85.8204532);
	var latLong_Trivandrum = new google.maps.LatLng(8.499733,76.9243616);
	var latLong_Patna = new google.maps.LatLng(25.6089598,85.1641572);
	var latLong_Delhi = new google.maps.LatLng(28.6469655,77.0932634);
	var latLong_Dehradun = new google.maps.LatLng(30.3254285,78.0171347);
	var latLong_All = new google.maps.LatLng(22.892282,79.8293912);
       
       $( function () {

       	//Google Maps
		
		var map;
		function initialize() {
			var latLongIndia = new google.maps.LatLng(21.7679,  78.8718);
	 		 var mapOptions = {
				zoom: 4,
				center: latLongIndia
	 		 };
	 		 map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

	 		// To add the marker to the map, use the 'map' property
	 		var marker_all = new google.maps.Marker({
			    position: latLong_All,
			    map : map,
			    title:"All regions"
			});
	 		
	 		
			var marker_chennai = new google.maps.Marker({
			    position: latLong_Chennai,
			    map : map,
			    title:"Chennai region"
			});

			var marker_ajmer = new google.maps.Marker({
			    position: latLong_Ajmer,
			    map : map,
			    title:"Ajmer region"
			});

			var marker_guwahati = new google.maps.Marker({
			    position: latLong_Guwahati,
			    map : map,
			    title:"Guwahati region"
			});

			var marker_panchkula = new google.maps.Marker({
			    position: latLong_Panchkula,
			    map : map,
			    title:"Panchkula region"
			});

			var marker_allahabad = new google.maps.Marker({
			    position: latLong_Allahabad,
			    map : map,
			    title:"Allahabad region"
			});

			var marker_bhubaneswar = new google.maps.Marker({
			    position: latLong_Bhubaneswar,
			    map : map,
			    title:"Bhubaneswar region"
			});

			var marker_tvc = new google.maps.Marker({
			    position: latLong_Trivandrum,
			    map : map,
			    title:"Trivandrum region"
			});

			var marker_patna = new google.maps.Marker({
			    position: latLong_Patna,
			    map : map,
			    title:"Patna region"
			});

			var marker_delhi = new google.maps.Marker({
			    position: latLong_Delhi,
			    map : map,
			    title:"Delhi region"
			});

			var marker_dd = new google.maps.Marker({
			    position: latLong_Dehradun,
			    map : map,
			    title:"Dehradun region"
			});
	 		 
		}
		google.maps.event.addDomListener(window, 'load', initialize);
       });
	</script>	