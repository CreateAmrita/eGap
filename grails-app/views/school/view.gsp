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
        
        <!-- Ionicons -->
        <link href="${resource(dir:'css/egov_css/',file:'butterScroll.css')}" rel="stylesheet" type="text/css" />
        
       
        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
	
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
		
		<script src="${createLinkTo(dir:'js/egov_js',file:'anchr_butterscroll-0.0.1.js')}" type="text/javascript"></script>
		
        
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
		   
		section.content-header > h3 {
			color:#006AB8;
		} 
		.content-header {
		    box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.1);
		}  
		   
		.content-box {
		    box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.3);
		    margin:0 0px 5px 0px;
		}    
		
		#schoolList{
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
		   
		#map-canvas {
			max-width: 698px;
			height: auto;
			margin: 0 auto;
			padding: 0px
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
		
		.navig{
			//position: fixed;
			background-color: #F5F5F5;
			font-size: 1.2em;
		}
		
		.navig > li > a:hover {
			background-color: #428BCA;
			color: white	
			
 		}
		.affix-top,.affix{
		 position: relative;
		}
		
		@media (min-width: 1750px) {
		  #sidebar.affix-top {
		    position: static;
		  	width:282px;
		  }
		  
		  #sidebar.affix {
		    position: fixed;
		    width:282px;
		    margin-top: -190px;
		  }
		}
		
		@media screen and (min-width: 1375px) and (max-width: 1745px) {
		  #sidebar.affix-top {
		    position: static;
		  	width:220px;
		  }
		  
		  #sidebar.affix {
		    position: fixed;
		    width:220px;
		    margin-top: -190px;
		  }
		}
	
		@media screen and (min-width: 768px) and (max-width: 1375px) {
		  #sidebar.affix-top {
		    position: static;
		  	width:180px;
		  }
		  
		  #sidebar.affix {
		    position: fixed;
		    width:180px;
		    margin-top: -190px;
		  }
		}
				
</style>
 
    </head>
    <body class="skin-blue">
    
        <g:render template="/templates/header" model="['login':false]"></g:render>
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
        	<section class="content">	
            	<div class="row ">
            		<div class="col-lg-2 " >
            		</div>
            	
	            		<div class="col-lg-8 " >
	            			<section class="content-header">
							    <h3>
							        <i class="fa fa-building"> </i> ${school.schoolName}
							    </h3>
							    <ol class="breadcrumb">
							    	<sec:ifNotLoggedIn> 
			                        	<li><g:link controller="home" href="javascript:"><i class="fa fa-home"></i> Home</g:link></li>
			                        	 <li class="active"><i class="fa fa-building"></i> School</li>
			                        </sec:ifNotLoggedIn>
			                        <sec:ifLoggedIn> 
			                        	<li><g:link controller="ratings" action="acadRept"><i class="fa fa-home"></i>School Details</g:link></li>
			                         </sec:ifLoggedIn> 
			                    </ol>
							</section>
							
							<section class="content">
								<div class="row">
									<div class="col-lg-3 col-sm-3 col-xs-12">
										<br/>
										<ul class="nav nav-stacked navig" id="sidebar">
											<li><a href="#details">Details</a></li>
											<li><a href="#location">Location</a></li>
											<li><a href="#specifics">School Specifics</a></li>
											<li><a href="#enrollment">Enrollment Details</a></li>
											<li><a href="#infrastructure">Infrastructure</a></li>
											<li><a href="#classroom">Classroom Facilities</a></li>
											<li><a href="#facilities">School Facilities</a></li>
										</ul>
									</div>
									
									<div class="col-lg-9 col-sm-9 col-xs-12">
										<section id="details" class="content-header">
										    <h3><i class="fa fa-list"></i> Details</h3>
										</section>
										<table class="table table-striped">
							                <tbody>
							                	<tr>
								                  <td width="30%">School Name</td>
								                  <td><strong>${school.schoolName}</strong></td>
								                </tr>
								                <tr>
								                  <td>Affiliation Number</td>
								                  <td><strong>${Math.round(school.schoolAfflNo)}</strong></td>
								                </tr>
								                <tr>
								                  <td>Zone</td>
								                  <td><strong>${school.zone}</strong></td>
								                </tr>
								                <tr>
								                  <td>Address</td>
								                  <td><strong>${school.plcName} ${school.district} ${school.state}</strong></td>
								                </tr>
								                <tr>
								                  <td>Pincode</td>
								                  <td><strong>${school.pincode}</strong></td>
								                </tr>
								                <tr>
								                  <td>Email</td>
								                  <td><strong>${school.emailId}</strong></td>
								                </tr>
								                <tr>
								                  <td>Website</td>
								                  <td><strong>${school.website}</strong></td>
								                </tr>
								                <tr>
								                  <td>Founded in</td>
								                  <td><strong>${school.yrFounded}</strong></td>
								                </tr>
							              </tbody>
							            </table>
							            
							            <section class="content-header" id="location">
										    <h3><i class="fa fa-map-marker"></i> Location</h3>
										</section>
							            <section class="content">
											<div class="row">
												<div class="col-lg-12">
													<div id="map-canvas" style="height: 550px;"></div>
												</div>
											</div>
										</section>
										
										<section class="content-header" id="specifics">
										    <h3><i class="fa fa-university"></i> School Specifics</h3>
										</section>
										
										<table class="table table-striped">
							                <tbody>
							                	<tr>
								                  <td width="30%">School Category</td>
								                  <td><strong>${school.schlCat}</strong></td>
								                </tr>
								                <tr>
								                  <td>Medium of Instruction</td>
								                  <td><strong>${school.schlMedium}</strong></td>
								                </tr>
								                <tr>
								                  <td>Type of School</td>
								                  <td><strong>${school.schlType}</strong></td>
								                </tr>
							              </tbody>
							            </table>
										
										<section class="content-header" id="enrollment">
										    <h3><i class="fa fa-graduation-cap"></i>Enrollment Details</h3>
										</section>
										
										<table class="table table-striped">
							                <tbody>
							                	<tr>
								                  <th width="30%">Class Section</th>
								                  <th>Section Count</th>
								                </tr>
							                	<tr>
								                  <td width="30%">Nursery/KG/LKG</td>
								                  <td><strong>${school.nurLkgUkgSecNo}</strong></td>
								                </tr>
								                <tr>
								                  <td>I-V</td>
								                  <td><strong>${school.oneToFiveSecNo}</strong></td>
								                </tr>
								                <tr>
								                  <td>VI-VIII</td>
								                  <td><strong>${school.sixToEightSecNo}</strong></td>
								                </tr>
								                <tr>
								                  <td>IX-X</td>
								                  <td><strong>${school.nineToTenSecNo}</strong></td>
								                </tr>
								                <tr>
								                  <td>XI-XII</td>
								                  <td><strong>${school.elevenTwelveSecNo}</strong></td>
								                </tr>
								                
							              </tbody>
							            </table>
							            
							            <section class="content-header" id="infrastructure">
										    <h3><i class="fa fa-building-o"></i> School Infrastructure</h3>
										</section>
							            
							            <g:render template="/templates/schoolInfrastructure" model="['school':school]"></g:render>
							            
							             <section class="content-header" id="classroom">
										    <h3><i class="fa fa-child"></i> Classroom Facilities</h3>
										</section>
										
										 <g:render template="/templates/roomFacilities" model="['school':school]"></g:render>
										 
							             <section class="content-header" id="facilities">
										    <h3><i class="fa fa-building-o"></i> School Facilities</h3>
										</section>
										
										 <g:render template="/templates/schoolFacilities" model="['school':school]"></g:render>
										 
									</div>
								</div>
								
							</section>
	            		</div>
	            		
	            		<div class="col-lg-2 " >
	            		</div>
	            	</div>
	            </section>
    		</div>
        
		<g:render template="/templates/footer"></g:render>
        
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		<!-- Google Maps V3 -->
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places" type="text/javascript"></script>
		
		   <script>
		   var map;
		   var initialize =	function(lat,lng){
					var latLong = new google.maps.LatLng(lat,lng);
			 		 var mapOptions = {
						zoom: 5,
						center: latLong
			 		 };
			 		 map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
				}
				//google.maps.event.addDomListener(window, 'load', initialize);

    		var getCords = function(school,place,district,state){
    			var url = "https://maps.googleapis.com/maps/api/geocode/json?address=${school.schoolName},${school.plcName},${school.district},${school.state}";
    			$.ajax({
					url:url,
					success:function(data){
						if(data.results.length >= 1){
							var lat = data.results[0].geometry.location.lat;
							var lng = data.results[0].geometry.location.lng;
							initialize(lat,lng);
							new google.maps.Marker({
						    	position: new google.maps.LatLng(lat,lng),
						    	map : map,
						    	title:"${school.schoolName}"
							});
						}
						else{
							$("#map-canvas").html("<h4><i class='fa fa-map-marker'></i><strong> Location not avaiable</strong></h4>").addClass("text-center text-danger").css("height","20px");
						}
					}
				});
    		}
			$(document).ready(getCords);

			$(document).ready(function(){
				$('a').butterScroll({});
				});
			
			$(document).ready(function(){

				/* activate sidebar */
				$('#sidebar').affix({
				  offset: {
				    top: 235
				  }
				});

						
				
				});
			
        </script>
		
     </body>
</html>