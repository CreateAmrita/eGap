<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><g:if test="${session.pgTitle}">${session.pgTitle}</g:if><g:else>e-Governance</g:else></title>
		<link rel="icon" type="image/png" href="${resource(dir:'egov_img',file:'nationEmblem.png')}" style="max-width:50%; max-height:50%;">
        
        <link href="${resource(dir:'css/egov_css/',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css" />
        <link href="${resource(dir:'css/egov_css/',file:'font-awesome.min.css')}" rel="stylesheet" type="text/css" />
        
         <!-- Theme style -->
        <link href="${resource(dir:'css/egov_css/',file:'AdminLTE.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Ionicons -->
        <link href="${resource(dir:'css/egov_css/',file:'ionicons.min.css')}" rel="stylesheet" type="text/css" />
        
 
 		<style>
        	
        body{
        	/* Prevent rightpadding pussing the body when popup is invoked*/
        	padding-right:0px !important;
        }
		
		*:not(i){font-family: 'Source Sans Pro', sans-serif !important;}
				
		.ui-helper-hidden-accessible{
			display:none;
		}
		
		.no-top-padding{
			padding-top: 0px !important;
		}
		    
		.content-header {
		    box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.1);
		}  
		   
		.content-box {
		    box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.3);
		    margin:0 0px 5px 0px;
		}    
		
		#schoolListDetails{
			margin:0;
			padding:0;
		}  
		
		.schoolListItem{
			list-style: none;
			border-bottom:1px solid #CCCCCC; 
			padding:10px 0px;
		}
		
		.schoolListItem > span{
			display:inline;
		}
		
		
		
		.schoolListItem .label {
	        border-radius: 50%;
		    font-size: 15px;
		    font-weight: normal;
		    width: 25px;
		    height: 25px;
		    display: inline-block;
		    line-height: 1em;
		    padding: 5px;
		}
		
		.label{
		    border-radius: 5px;
		    font-size: 15px;
		    font-weight: normal;
		    height: 25px;
		    display: inline-block;
		    line-height: 1em;
		    padding: 5px;
		}
		   
		
		#schoolListDetails > .row{
			margin-bottom:20px;
			padding:10px 0px;
			border-radius:5px;
		}
		
		#schoolListDetails h4{
			color:#006AB8;
		}
		
		.schoolIcon{
			padding-top:10px;
			color:#006AB8;
		}
		
		.content-header {
		    position: relative;
		}
		
		.compareContainer {
		    position: absolute;
		    right: 0px;
		    bottom: 0px;
		}
		.scrollProp{
		    height: 470px;
    		overflow-y: hidden;
		}	
        </style>
 
 
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
		<g:render template="/templates/header" model="['login':true]"></g:render>
       	<!-- End of header --> 
        
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
           <!-- Left side column for sidebar navigation-->
			<g:render template="/templates/navMenuLeft"></g:render>

			        
         <aside class="right-side">
         	 <section class="content-header">
                 <h1>
                      Schools 
                 </h1>
                 <ol class="breadcrumb">
                     <li><a href="javascript:"><i class="fa fa-bar-chart-o"></i> School</a></li>
                     <li class="active">School Details</li>
                 </ol>
             </section>
                
        	<section class="content">	
            	<div class="row ">
	            		<div class="col-lg-8" style="width:100%;">
							<section class="content">
								 <div class="row">
									<div class="col-md-12">
										<div class="callout callout-info" style="margin-bottom: 1em!important;">
									        <h3>School Specifics</h3>
									    </div>
									</div>
								</div>
					
								<div class="row">
									<div class="col-lg-4 col-sm-4 col-xs-12" style="width:50%">
										<div class="form-group">
							                <h4>Zone</h4>
							                <select class="selectpicker form-control" name="Zone" id="Zone">
							                 	<g:each in="${zoneList.zones}" var="i" status="ik">
													<option value="${i.value.zoneId}" data-id="${i.value.zoneId}" <g:if test="${selZone.toInteger() == i.value.zoneId.toInteger()}">selected="selected"</g:if>>${i.value.zoneName}</option>
												</g:each>	
							                </select>
						              </div> 
						               <div class="form-group">
							                <h4>Region</h4>
							                <select class="selectpicker form-control" name="Region" id="Region">
							                	<g:each in="${regionList.regions}" var="i" status="ik">
													<option value="${i.value.regionId}" data-id="${i.value.regionId}" <g:if test="${selRegion.toInteger() == i.value.regionId.toInteger()}">selected="selected"</g:if>>${i.value.regionName}</option>
												</g:each>
							                </select>
						              </div>
						               <div class="form-group">
							                <h4>Cluster</h4>
							                <select class="selectpicker form-control" name="Cluster" id="Cluster">${clusterList.clusters}
							                	<g:each in="${clusterList.clusters}" var="i" status="ik">
													<option value="${i.value.clusterId}" data-id="${i.value.clusterId}" <g:if test="${selCluster.toInteger() == i.value.clusterId.toInteger()}">selected="selected"</g:if>>${i.value.clusterName}</option>
												</g:each>
							                </select>
						              </div>
							          <div class="form-group">
							               <h4>State</h4>
										   <select id="state" name="state" class="form-control">
										   		<g:each in="${stateList.states}" var="i" status="ik">
													<option value="${i.value.stateName}" <g:if test="${selState == i.value.stateName}">selected="selected"</g:if>>${i.value.stateName}</option>
												</g:each>
										   </select>
							          </div>
								</div>
								
								
								<div id="mapContainer" class="col-lg-8 col-sm-8 col-xs-12" style="width:50%">
									<div id="map-canvas" style="height: 450px; margin: 0 auto"></div>
								</div>
								
								
							</div>
								
								
							
							</section>
							
							<section class="content-header">
	           					<div class="box ">
									<div class="box-header">
									<!-- tools box -->
										<div class="pull-right box-tools">
											<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
										</div><!-- /. tools -->
										<i class="fa fa-line-chart"></i>
										<h4 class="box-title" style="font-weight: bold;">CBSE Schools List</h4>
									</div>
									<div class="box-body chart-responsive" style="height: 478px;">
										<div id="schoolListDetails" class="scrollProp" style="min-width: 310px; height: 200px; margin: 0 auto"></div>
									</div>
								</div>
	           				</section>
	            		</div>
	            	</div>
	            </section>
	         </aside>

	   </div>

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
		
		 <!-- Scroll  -->
        <script src="${createLinkTo(dir:'js/egov_js/',file:'nicescroll.js')}" type="text/javascript"></script>
        
        
		<!-- Google Maps V3 -->
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places;" type="text/javascript"></script>
        
        <!-- Google Maps V3 -->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAe45vAXLQqSFQLNeiQbCo9p7r_4lQbjQc&callback=initMap" type="text/javascript"></script>
		
		
<script>
				   var map;
				   var initialize;
				   $(function() {
					   $('#state').change();
				       	//Google Maps
				   initialize =	function(){
							var latLongIndia = new google.maps.LatLng(21.7679,  78.8718);
					 		 var mapOptions = {
								zoom: 4,
								center: latLongIndia
					 		 };
					 		 map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
						}
						//google.maps.event.addDomListener(window, 'load', initialize);
				   });
				   
			$('#Zone').change(function() {
				var data = "zoneId="+$('#Zone').find("option:selected").val();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rZoneRegion",
					data : data,
					success:function(data){
						var len = data.totRegions;
						var regions = data.regions;
						$("#Region").html("");
						for(var i=0;i<len;i++){
							var x = "region" + (i+1);
							$("#Region").append("<option value='"+regions[x].regionId +"'>"+regions[x].regionName+"</option>");
						}
						$("#Region").change();
					}
				});
			});
			$('#Region').change(function() {
				var data = "zoneId="+$('#Zone').find("option:selected").val()+"&regionId="+$(this).find("option:selected").val();
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rZoneRegionClusters",
					data : data,
					success:function(data){
						var len = data.totClusters;
						var clusters = data.clusters;
						$("#Cluster").html("");
						for(var i=1;i<=len;i++){
							var x = "cluster" + i;
							$("#Cluster").append("<option value='"+clusters[x].clusterId +"'>"+clusters[x].clusterName+"</option>");
						}
						$("#Cluster").change();
					}
				});
			});

			$('#Cluster').change(function() {
				var zoneId = $('#Zone').find("option:selected").val()
				var regionId = $('#Region').find("option:selected").val()
				var clusterId = $(this).find("option:selected").val()
				var data = "zoneId="+zoneId+"&regionId="+regionId+"&clusterId="+clusterId;
				$.ajax({
					url: "${grailsApplication.config.grails.serverURL}/StudTeachGraphs/rStatesUnderCluster",
					data : data,
					success:function(data){
						var len = data.totStates;
						var states = data.states;
						$("#state").html("");
						for(var i=1;i<=len;i++){
							var x = "state" + i;
							$("#state").append("<option value='"+states[x].stateName +"'>"+states[x].stateName+"</option>");
						}
						$("#state").change();
					}
				});
			});
    		var getCords = function(school,place,district,state){
       		var schoolName = ($.trim(school) == "" ? "" : ($.trim(school)+ "+") ) ;
			var place = ($.trim(place) == "" ? "" : ($.trim(place)+ "+") ) ;
			var district = ($.trim(district) == "" ? "" : ($.trim(district)+ "+") ) ;
			var state = ($.trim(state) == "" ? "" : ($.trim(state)+ "+") ) ;
   			var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + schoolName + place + district + state;
   			$.ajax({
					url:url,
					success:function(data){
					//console.log(data.results[0].geometry.location.lat + " " + data.results[0].geometry.location.lng );
					new google.maps.Marker({
					    position: new google.maps.LatLng(data.results[0].geometry.location.lat,data.results[0].geometry.location.lng),
					    map : map,
					    title:school
					});
				}
			});
        	}
						$("#state").bind("change",function(){
								var state = $(this).val();
								$.ajax({
									url:"${grailsApplication.config.grails.serverURL}/ratings/listschool?state="+$("#state").val(),
									beforeSend: function(){
										$('#schoolListDetails').html("<img src='${resource(dir:'images',file:'spinner.gif')}' /> Please wait while the data is being loaded...").css({'font-size': 'large', 'margin-left': '25%', 'margin-top': '40px'});
									},
									success:function(data){
										if(data.msg){
											$("#schoolListDetails").addClass("nodataContainer")
											$('.nodataContainer').text("No schools Exist for the selected State .").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
											//$("#map-canvas").addClass("nodataContainer")
											$('.nodataContainer').text("No schools Exist for the selected State .").css({'font-size': 'large', 'margin-left': '160px', 'margin-top': '40px'});
											initialize();
											
										}
										else{
											$("#schoolListDetails").html("").removeClass("nodataContainer").removeAttr("style").css({'overflow-y':'hidden'});
											$("#schoolListDetails").html("");
											//$("#map-canvas").html("").removeClass("nodataContainer");
											$("#schoolName").html("");
											$("#schoolName").html(state);
											$(".scrollProp").niceScroll({
										    	 cursorwidth: "10px",
										    	 hidecursordelay: 1000,
										    
										    });
											initialize();
											for(i=0; i < data.length; i++){
												var school = data[i];
												var flag = "";
												if(school.rating >= 8){
													flag = "label-success"
												}	
												else if(school.rating <= 7 && school.rating > 5){
													flag = "label-warning"	
												}
												else{
													flag = "label-danger"	
												}
												var bubble = "<span class='label " + flag + "'>"+ school.rating + "</span>";
												schoolDetails(school);
												getCords(school.schoolName,school.plcName,school.district,school.state);
											}
										}
									}
								});
						});
						 
				var setParams = function(thisObj,schlId){
					var zoneId = $('#Zone').find("option:selected").val()
					var regionId = $('#Region').find("option:selected").val()
					var clusterId = $("#Cluster").find("option:selected").val()
					var state = $("#state").find("option:selected").val();
					href = $(thisObj).attr("href").split("?");
					var p_data="?schoolId="+schlId+"&zoneId="+zoneId+"&regionId="+regionId+"&clusterId="+clusterId+"&state="+state;
					$(thisObj).attr("href",href[0]+p_data);
				}
		
				var schoolDetails = function(school){
					var zoneId = $('#Zone').find("option:selected").val()
					var regionId = $('#Region').find("option:selected").val()
					var clusterId = $("#Cluster").find("option:selected").val()
					var state = $("#state").find("option:selected").val();
					var  row = 	'<div class="row content-box">'+
									'<div  class="col-lg-1 col-md-1 col-xs-1">'+
										'<div  class="row">'+
											'<div  class="col-lg-12">'+ 
												'<i class="schoolIcon fa fa-building fa-3x"></i></div>'+
											'</div>'+
										'</div>'+
									'<div  class="col-lg-6 col-md-6 col-xs-11">'+
										'<div  class="row">'+
										'<div  class="col-lg-12">'+
											'<a href="${grailsApplication.config.grails.serverURL}/ratings/schoolView/" onclick="setParams(this,'+ school.id +');"><h4>'+ school.schoolName +'</h4></a>'+
										'</div>'+
										'<div  class="col-lg-12">'+
											'<span>'+ school.plcName + ', ' + school.district + ', ' + school.state +'</span>'+
										'</div>'+
										'</div>'+
									'</div>'+
									
									'<div  class="col-lg-3 col-md-3 col-xs-12">'+
										'<div  class="row">'+
										'<div  class="col-lg-12">'+
											
										'</div>'+
										'<div  class="col-lg-12">'+
											
										'</div>'+
										'</div>'+
									'</div>'+
						
								
								'</div>';
					$("#schoolListDetails").append(row);
		
				
				}
		
		
				$(document).ready(function(){
//					$("#state").val("ASSAM").change();
					   
				    
				});
		
        </script>
		
			
   </body>
</html>