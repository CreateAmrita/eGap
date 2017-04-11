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
		
		<!-- Star rating -->
		<script src="${createLinkTo(dir:'js/egov_js/',file:'star-rating.min.js')}" type="text/javascript"></script>
		<link href="${resource(dir:'css/egov_css/',file:'star-rating.min.css')}" rel="stylesheet" type="text/css" />
        
        <style>
        	
        body{
        	/* Prevent rightpadding pussing the body when popup is invoked*/
        	padding-right:0px !important;
        }
		
		/* *:not(i){font-family: 'Source Sans Pro', sans-serif !important;} */
				
		.ui-helper-hidden-accessible{
			display:none;
		}
		
		h2{
			color: #006AB8
		}
		.content-header {
		    box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.1);
		    padding: 0px 0px 0px 15px;
		}  
		   
		.content-box {
		    box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.3);
		    margin:0 0px 5px 0px;
		}   
		
		div > h4{
			padding-top:10px;
		} 
        </style>
 
    </head>
    <body class="skin-blue">
    
        <g:render template="/templates/header" model="['login':false]"></g:render>
        
            <div class="wrapper row-offcanvas row-offcanvas-left">
            	<div class="row ">
            		<div class="col-lg-2" >
            		</div>
            	
            		<div class="col-lg-8" >
            			<section>
            				<div class="row content">
            				  <div class="col-lg-2 col-sm-2"></div>
							  <div class="col-lg-8 col-sm-8 col-xs-12">
							  	<h2 align="center">Rate your school</h2>
							    <div class="input-group">
							      <input type="text" id="searchSchool" class="form-control" placeholder="Search for schools.">
							       <div class="input-group-btn">
							        <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
							      </div>
							    </div>
							  </div>
							  <div class="col-lg-2 col-sm-2"></div>
							</div>
            			</section>
            			<div class="row">
            				<div class="col-lg-12">
		            			<section class="content-header">
								    <h3>
								        <i class="fa fa-building-o"></i> Top rated CBSE schools in India
								    </h3>
								     <ol class="breadcrumb">
				                        <li><g:link controller="home" href="javascript:"><i class="fa fa-home"></i> Home</g:link></li>
				                        <li class="active"><i class="fa fa-list"></i> Ratings</li>
				                    </ol>
								</section>
							</div>
						</div>
						  
						<section class="content">
							<div class="row content">
								<g:each in="${school}" var="i" status="j">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="row content-box top-schools-ele">
											<div class="col-lg-1 col-md-1 col-sm-1 col-xs-2">
												<img src="${resource(dir:'egov_img',file:'School-48.png')}">
											</div>
									    	<div class="col-lg-5 col-md-4 col-sm-4 col-xs-3" >
									    		<g:link controller="school" action="view" id="${i.id}"><h4>${i.schoolName.toUpperCase()}</h4></g:link>
									    		<p>${i.state.toUpperCase()}</p>
									    	</div>
									    	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-5">
												 <input id="input-2" class="rating" data-min="0" data-max="5" data-step="1" data-size="sm">
									    	</div>
									    	<div class="col-lg-2 col-md-2 col-sm-3 col-xs-2">
									    		<h4>Based on ${i.review} reviews</h4>
									    	</div>
									    </div>
									 </div>
								</g:each>
							</div> 
						</section>
            		</div>
            		
            		<div class="col-lg-2" >
            		</div>
            		
            	</div>
       	   </div>
       	   
		<g:render template="/templates/footer"></g:render>
        
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
		
		<script>

				$(document).ready(function(){
					 <!-- AutoComplete -->
				    var options = {
							  url: "${grailsApplication.config.grails.serverURL}/school/autoComplete",
							  getValue: "Name",
							  list: {
								  onClickEvent: function() {
									  var schoolId = $("#searchSchool").getSelectedItemData().school;
									  window.location.href="rate/"+schoolId;		
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
     </body>
</html>