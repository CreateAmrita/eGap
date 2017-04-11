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
        
        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
	
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
		
		<!-- Google Maps V3 -->
		<script src="https://maps.googleapis.com/maps/api/js" type="text/javascript"></script>
		
		<!-- Google Maps V3 -->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAe45vAXLQqSFQLNeiQbCo9p7r_4lQbjQc&callback=initMap" type="text/javascript"></script>
        
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
		    box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.1);
		    margin:0 0px 5px 0px;
		}      
		
		.top-schools .label {
		    border-radius: 20%;
		    font-size: 10px;
		    font-weight: normal;
		    width: 20px;
		    height: 20px;
		    line-height: 3em;
		    padding: 5px;
		}
		
		.top-schools .top-schools-ele{
			min-height:90px;
		}
		
		.top-schools-ele {
		    overflow-wrap: break-word;
		}
		
		section.content-header > h3 {
			color:#006AB8;
		}
		   
        </style>
 
    </head>
    <body class="skin-blue">
        
        <g:render template="/templates/header" model="['login':false]"></g:render>
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
        		<g:render template="/templates/imageCarousel"></g:render>
            	<div class="row ">
            		<div class="col-lg-2 " >
            		</div>
            	
            		<div class="col-lg-8 " >
            			
            			<g:render template="/templates/homeScreenCircleLinks"></g:render>
           				<g:render template="/templates/topRatedSchools" model="['schools':topSchools]"></g:render>
           				<g:render template="/templates/cbseRegions"></g:render>
           				
            		</div>
            		
            		<div class="col-lg-2 " >
            		</div>
            	</div>
        </div>
        
       <g:render template="/templates/footer"></g:render>
        
        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>
             
        
        <script>
      
		  // High Charts 	
	
       
        </script>
        
     </body>
</html>