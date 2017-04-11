<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><g:if test="${session.pgTitle}">${session.pgTitle}</g:if><g:else>e-Governance</g:else></title>
		<link rel="icon" type="image/png" href="${resource(dir:'egov_img',file:'nationEmblem.png')}" style="max-width:50%; max-height:50%;">
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
       
        
        <link href="${resource(dir:'css/egov_css/',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css" />
        <link href="${resource(dir:'css/egov_css/',file:'font-awesome.min.css')}" rel="stylesheet" type="text/css" />
        
         <!-- Theme style -->
        <link href="${resource(dir:'css/egov_css/',file:'AdminLTE.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Ionicons -->
        <link href="${resource(dir:'css/egov_css/',file:'ionicons.min.css')}" rel="stylesheet" type="text/css" />
 
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
		<g:render template="/templates/header" model="['login':true]"></g:render>
       	<!-- End of header --> 
        
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
           
            <!-- Left side column for sidebar navigation-->
			<g:render template="/templates/navMenuLeft"></g:render>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Schools
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-twitch"></i>Schools</a></li>
                        <li class="active">Region Analytics</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content" id="CommonFilter" role="${role}">
                	 <div class="row">
						<div class="col-md-12">
							<div class="callout callout-info" style="margin-bottom: 1em!important;">
						        <h3>Region Analytics based on Optional Subject selection</h3>
						    </div>
						</div>
					</div>
                    <div class="row">
            		   		<!-- Prediction box -->
	                       <section class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                            <div class="box">   
	                            	<div class="box-header">
	                                    <!-- tools box -->
	                                    <i class="fa fa-map-marker"></i>
	                                    <h3 class="box-title">Select any marker to load the trend</h3>
	                                </div>                        
	                                <div class="box-body chart-responsive">
	                                    <div id="map-canvas" style="height: 400px; margin: 0 auto"></div>
	                                </div><!-- /.box-body -->
	                            </div>
	                        </section>
	                        
	                        <section class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	                            <div class="box"> 
	                                <div class="box-body chart-responsive">
	                                    <div id="container" style="height: 400px; margin: 0 auto">
	                                    ${roleRegions }</div>
	                                </div><!-- /.box-body -->
	                            </div>
	                        </section>	
                    </div><!-- /.row (main row) -->
                </section><!-- /.content -->    
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->
        
        <!--  Footer  -->
		<footer class="footer">
        	<img src="${resource(dir:'egov_img',file:'avvp.png')}" alt="AVVP"> <img src="${resource(dir:'egov_img',file:'cdac-logo.png')}" border="0" alt="CDAC">
        </footer>
        <!--  Footer  -->

		
        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
	
      
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		<!-- Google Maps V3 -->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvIgqC3_LDJHAb4pLq0t2g-4NtgBNR6uM" type="text/javascript"></script>
		
		 <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'drilldown.js')}" type="text/javascript"></script>
        
        <script>
		$('document').ready(function(){
			fetchRoleRegions()
			//fetchRegionDetails();
		});
		var fetchRoleRegions = function(){
			$(".box").show();
			var p_data = ""
			$.ajax({
				url: "${grailsApplication.config.grails.serverURL}/Ratings/roleRegions",
				data : p_data,
				success:function(data){
					console.log(data)
					initialize(data);
					if(($("#CommonFilter").attr('role')=="[ROLE_CCEADMIN]") ||($("#CommonFilter").attr('role')=="[ROLE_SCHOOLS_MANAGER]") ){
						fetchAllRegionDetails();
					}
					else
						fetchRegionDetails(data.regions[0]);
				}
			});
		}

			function initialize(data) {
//					google.maps.event.addDomListener(window, 'load', initialize);
					var map,j;
					var latLongIndia = new google.maps.LatLng(21.7679,  78.8718);
//					var latLong_All = new google.maps.LatLng(22.892282,79.8293912);
			 		 var mapOptions = {
						zoom: 4,
						center: latLongIndia
			 		 };
			 		map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
					for(j=0;j<data.regCount;j++){
						var region = data.regions[j]
						var latLong = new google.maps.LatLng(data.latitudes[j],data.longitudes[j]);
						var marker = new google.maps.Marker({
							position: latLong,
							map : map,
							title:data.regions[j]
						});
						google.maps.event.addListener(marker, 'click', (function(marker, j) {
					        return function() {
					        	fetchRegionDetails(data.regions[j]);
					        }
					    })(marker, j));
					    /*
						google.maps.event.addListener(marker, 'click', function() {
							alert(j)
							alert(region)
							fetchRegionDetails(region);
						});
						*/
					}

					
			}

			var fetchAllRegionDetails = function(){
				var data = "region=All";
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/Ratings/fetchRegionDetails",
					data : data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){
						if(data.message){
							 $('#container').addClass("nodataContainer")
							 $('.nodataContainer').text("No data available for the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
						}
						else{
							$('#container').removeClass("nodataContainer").removeAttr("style");
							$('#container').html("").css({'min-width': '310px', 'height': '440px', 'margin': '0 auto'})
							$('#container').highcharts({
				                title: {
				                    text: 'Overall regional prediction for stream slection',
				                    x: -20 //center
				                },
				                subtitle: {
				                    text: 'All Region',
				                    x: -20
				                },
				                xAxis: {
				                    categories: data.categories
				                },
				                yAxis: {
				                    title: {
				                        text: 'Count'
				                    },
				                    plotLines: [{
				                        value: 0,
				                        width: 1,
				                        color: '#808080'
				                    }]
				                },
				                tooltip: {
				                    valueSuffix: ''
				                },
				                legend: {
				                    layout: 'vertical',
				                    align: 'right',
				                    verticalAlign: 'middle',
				                    borderWidth: 0
				                },
				                series: data.series
				            });
						}
						
					}
				});
			}
	
			var fetchRegionDetails = function(region){
				var data = "region="+region;
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/Ratings/fetchRegionDetails",
					data : data,
					beforeSend: function(){
						$('#container').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
					},
					success:function(data){
						if(data.message){
							 $('#container').addClass("nodataContainer")
							 $('.nodataContainer').text("No data available for the selected criteria.").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px', 'height': '440px'});
						}
						else{
							$('#container').removeClass("nodataContainer").removeAttr("style");
							$('#container').html("").css({'min-width': '310px', 'height': '440px', 'margin': '0 auto'})
							$('#container').highcharts({
				                title: {
				                    text: 'Overall Regional Analytics for Subject selection',
				                    x: -20 //center
				                },
				                subtitle: {
				                    text: region+' Region',
				                    x: -20
				                },
				                xAxis: {
				                    categories: data.categories
				                },
				                yAxis: {
				                    title: {
				                        text: 'Count'
				                    },
				                    plotLines: [{
				                        value: 0,
				                        width: 1,
				                        color: '#808080'
				                    }]
				                },
				                tooltip: {
				                    valueSuffix: ''
				                },
				                legend: {
				                    layout: 'vertical',
				                    align: 'right',
				                    verticalAlign: 'middle',
				                    borderWidth: 0
				                },
				                series: data.series
				            });
						}
						
					}
				});
			}
        </script>
   </body>
</html>