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
        
         <!-- AutoComplete -->
        <link href="${resource(dir:'css/egov_css/',file:'easy-autocomplete.min.css')}" rel="stylesheet" type="text/css" />
        
       
        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
	
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
		 
		 <!-- AutoComplete -->
		<script src="${createLinkTo(dir:'js/egov_js/',file:'jquery.easy-autocomplete.min.js')}" type="text/javascript"></script>
		
		<script src="${createLinkTo(dir:'js/egov_js/',file:'loadingoverlay.min.js')}" type="text/javascript"></script>
		
       
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
				
		.scrollProp{
		    height: 550px;
    		overflow-y: scroll;
  		    overflow: auto;
		
		}
		.scrollProp img {
			display: block;
		    margin-left: 40%;
		    margin-right: auto;
		    position: absolute;
		    top: 40%;
		    bottom: 0px;
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
							        <i class="fa fa-search"> </i> Search for CBSE affiliated Schools
							    </h3>
							    <ol class="breadcrumb">
			                        <li><g:link controller="home" href="javascript:"><i class="fa fa-home"></i> Home</g:link></li>
			                        <li class="active"><i class="fa fa-search"></i> Search Schools</li>
			                    </ol>
							</section>
							
							<section class="content">
								<div class="row">
									<div class="col-lg-4 col-sm-4 col-xs-12">
										<div class="form-group">
						                  <select class="form-control" id="stateSelect">
						                  	<optgroup>
										        <option value="0" disabled selected>Search by state</option>
										    </optgroup>
										    <optgroup label="_________">
										    	<g:each in="${states?.sort {it} }" var="s">
										    		<option value="${s}">${s}</option>
										    	</g:each>
										    </optgroup>
						                  </select>
						                </div>
									</div>
								
									<div class="col-lg-8 col-sm-8 col-xs-12">
										<div class="input-group ">
											<span class="input-group-addon"><i class="fa fa-search"></i></span>
							            	<input type="text" placeholder="Search by school name" id="searchSchool">
							            </div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-4 col-sm-4 col-xs-12">
										<div class="row">
											<div class="col-lg-12">
												<span> School rating </span><span class='label label-success'>High</span> <span class='label label-warning'>Medium</span> <span class='label label-danger'>Low</span>
											</div>
										</div>
									</div>
									<div class="col-lg-8 col-sm-8 col-xs-12">
									</div>
								</div>
							
								<div class="row">
									<div class="col-lg-4 col-sm-4 col-xs-12 scrollProp">
										<ul id="schoolList">
                        				</ul>
									</div>
								
									<div id="mapContainer" class="col-lg-8 col-sm-8 col-xs-12">
										<div id="map-canvas" style="height: 550px;"></div>
									</div>
								</div>
							</section>
							
							<section class="content-header">
							    <h3>
							        <i class="fa fa-building"> </i> CBSE Schools in <span id="schoolName"></span>
							    </h3>
							    <div class="compareContainer">
							    	<span id="compareCount" class='label label-default'>0</span>
							    	<a href="${g.createLink(controller:'school', action:'compare')}"  id="compareList" data-list="" class="btn btn-social content-box" onclick="return compareList(this);"><i class="fa fa-check"></i> Compare</a>
							    </div>
							    
							</section>
	           				<section id="compareCountCheck"></section>
	           				<section id="schoolListDetails" class="content scrollProp">
	           					
	           				</section>
	            		</div>
	            		
	            		<div class="col-lg-2 " >
	            		</div>
	            	</div>
	            </section>
    		</div>
        
		<g:render template="/templates/footer"></g:render>
		
			<script>
				   var map;
				   var initialize;
				   $(function() {
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
		
					var addSchoolCompare = function(afflNo){
						var list = $("#compareList").attr("data-list");
						if(list == "")
							list = afflNo;
						else
							list+=(":"+afflNo);	
						$("#compareCount").html((list.split(":")).length);				
						$("#compareList").attr("data-list",list);
					} 
		
					var removeSchoolCompare = function(afflNo){
						var list = $("#compareList").attr("data-list");
						list = list.split(":");
						list.splice(list.indexOf(afflNo),1);
						var temp = ""+list;
						var nwList = temp.replace(/,/g,":");  //Use reg exp to replace all ","
						$("#compareCount").html(list.length);						
						$("#compareList").attr("data-list",nwList);			
					}
		    		
		        	var compareSchools = function(){
		         								
						var i = $(this).find("i");
						var afflNo = $(this).attr("data-affiliation");
						if($(i).hasClass("fa-circle")){
							$(this).removeClass("btn-twitter");
							$(this).addClass("btn-danger");
							
							$(i).removeClass("fa-circle");
							$(i).addClass("fa-check");
		
							addSchoolCompare(""+afflNo);
						}
						else if($(i).hasClass("fa-check")){
							$(this).removeClass("btn-danger");
							$(this).addClass("btn-twitter");
							
							$(i).removeClass("fa-check");
							$(i).addClass("fa-circle");
							
							removeSchoolCompare(""+afflNo);
						}

					<!--  Alert when more than 3 schools selected-->
		            
						var list = $("#compareList").attr("data-list");
		        		list = list.split(":");
						var count = list.length;
						var row = '<div class="alert alert-danger">'+
						                '<a class="close"' + 
				                        'aria-label="close">' + 
				                    	'&times;' + 
				                		'</a>' + 
				                		'<h4>'+
				                			'<center>'+'Please select atmost three schools to compare.'+'</center>' + 
				                		'</h4>'
		             			  '</div>';
						if (count>3)
							{
						  		 $("#compareCountCheck").append(row);
								 $("#compareList").addClass('disabled');
								 $("#compareCount").addClass('label-danger');
								 
							}
						else
							{
								 $("#compareCount").removeClass('label-danger');
								 $("#compareList").removeClass('disabled');
							}
					
						$(".alert").delay(800).slideUp(1000, function() {
						    $(this).alert('close');
						});
						
					}
		            
		        
					 $(function() {
		
						$("#stateSelect").bind("change",function(){
								var state = $(this).val();
								var image = $('#schoolList').html('<img src="http://www.ggproperties.com/wp-content/themes/elevate/img/ajax-loader.gif">');
								$.ajax({
									url:"${grailsApplication.config.grails.serverURL}/school/listschool?state="+state,
									success:function(data){
										$("#schoolListDetails").html("");
										$("#schoolName").html("");
										$("#schoolName").html(state);
										$("#schoolList").html("");
										$("#compareList").attr("data-list","");
										$("#compareList").removeClass('disabled');
										$("#compareCount").html("");
										$(".scrollProp").html(image);
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
											$("#schoolList").append("<li class='schoolListItem'>" + bubble + "<span> "+school.schoolName+"</span> </li>")
											schoolDetails(school);
											getCords(school.schoolName,school.plcName,school.district,school.state);
										}
										$(".compare").unbind().bind("click",compareSchools);
									}
								});
						});
						 
					 });
		
				var schoolDetails = function(school){
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
											'<a href="${grailsApplication.config.grails.serverURL}/school/view/'+ school.id +'"><h4>'+ school.schoolName +'</h4></a>'+
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
						
									'<div  class="col-lg-1 col-md-1 col-xs-12">'+
										'<div  class="row">'+
										'<div  class="col-lg-12 text-right">'+
											'<a data-affiliation="'+ school.schoolAfflNo +'" class="btn btn-social btn-twitter compare">'+
						                		'<i class="fa fa-circle"></i> Compare'+
						              		'</a>'+
										'</div>'+
										'</div>'+
									'</div>'+
								
								'</div>';
		
					$("#schoolListDetails").append(row);
		
				
				}
		
				function compareList(a){
					var list = $(a).attr("data-list");
					if((list.split(":")).length <= 1){
						$('#warningModal').modal('show')
						return false;
					}
					else{
						var href = $(a).attr("href");
						href += "?sch="+list;
						$(a).attr("href",href);
						return true;
					}
				}
				
		
				$(document).ready(function(){
					$("#stateSelect").val("GOA").change();
					   
				    
				});
		
				$(document).ready(function(){
						 <!-- AutoComplete -->
					    var options = {
								  url: "${grailsApplication.config.grails.serverURL}/school/autoComplete",
								  getValue: "Name",
								  list: {
									  onClickEvent: function() {
										  var schoolId = $("#searchSchool").getSelectedItemData().school;
		 								  window.location.href="view/"+schoolId;		
										},
										maxNumberOfElements: 3000,
									    match: {
									      enabled: true
									    }
								  },
								};
						$("#searchSchool").easyAutocomplete(options);
					
				});
	
		
        </script>


		<div class="modal fade " id="warningModal" tabindex="-1" role="dialog" aria-labelledby="helpModalLabel" aria-hidden="true">
            <div class="modal-dialog">      
         		<div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;
                            </span><span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title" id="">Compare Schools</h4>
                    </div>
   					<div class="modal-body">
                       <h4>Please select at least two schools to compare</h4>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
           			</div>
        		</div>
    		</div>
		</div> 							
		
 
		
     </body>
</html>
		
        
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		<!-- Google Maps V3 -->
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places;" type="text/javascript"></script>
        
        <!-- Google Maps V3 -->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBj4ijeXOU4aIbD_OtV03cAjZ_ICHLi9XI&callback=initMap" type="text/javascript"></script>
